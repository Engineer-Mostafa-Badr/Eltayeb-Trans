import 'package:eltyp_delivery/features/auth/domain/use_cases/delete_account_use_case.dart';
import 'package:eltyp_delivery/features/auth/domain/use_cases/resend_code_use_case.dart';
import 'package:eltyp_delivery/features/auth/domain/entities/delete_account_params.dart';
import 'package:eltyp_delivery/features/auth/data/models/login_response_model.dart';
import 'package:eltyp_delivery/features/auth/domain/use_cases/verify_use_case.dart';
import 'package:eltyp_delivery/features/auth/domain/use_cases/logout_use_case.dart';
import 'package:eltyp_delivery/features/auth/domain/use_cases/login_use_case.dart';
import 'package:eltyp_delivery/features/auth/domain/entities/logout_params.dart';
import 'package:eltyp_delivery/features/auth/domain/entities/login_params.dart';
import 'package:eltyp_delivery/features/auth/domain/entities/login_representative_params.dart';
import 'package:eltyp_delivery/features/auth/data/models/user_model.dart';
import '../../../domain/use_cases/login_representative_use_case.dart';
import 'package:eltyp_delivery/features/injection_container.dart';
import 'package:eltyp_delivery/core/api/dio/base_response.dart';
import 'package:eltyp_delivery/core/storage/main_hive_box.dart';
import 'package:eltyp_delivery/core/enum/enums.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'dart:async';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;
  final LoginRepresentativeUseCase loginRepresentativeUseCase;
  final LogoutUseCase logoutUseCase;
  final DeleteAccountUseCase deleteAccountUseCase;
  final VerifyUseCase verifyUseCase;
  final ResendCodeUseCase resendCodeUseCase;

  static LoginBloc get(BuildContext context) => BlocProvider.of(context);

  LoginBloc(
    this.loginUseCase,
    this.loginRepresentativeUseCase,
    this.logoutUseCase,
    this.deleteAccountUseCase,
    this.verifyUseCase,
    this.resendCodeUseCase,
  ) : super(const LoginState()) {
    on<LoginButtonPressedEvent>(_startLogin);
    on<LoginRepresentativeButtonPressedEvent>(_startLoginRepresentative);
    on<LogoutButtonPressedEvent>(_startLogout);
    on<DeleteAccountButtonPressedEvent>(_startDeleteAccount);
    on<VerifyButtonPressedEvent>(_startVerify);
    on<ResendCodeButtonPressedEvent>(_startResendCode);
  }

  FutureOr<void> _startLogin(
    LoginButtonPressedEvent event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(requestState: RequestState.loading));
    final result = await loginUseCase(event.parameters);
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            requestState: RequestState.error,
            response: BaseResponse<UserModel?>(
              status: false,
              msg: failure.message,
            ),
          ),
        );
      },
      (data) {
        emit(state.copyWith(requestState: RequestState.loaded, response: data));
      },
    );
  }

  FutureOr<void> _startLoginRepresentative(
    LoginRepresentativeButtonPressedEvent event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(representativeLoginRequestState: RequestState.loading));
    final result = await loginRepresentativeUseCase(event.parameters);

    // Check if emit is still valid after async operation
    if (emit.isDone) {
      debugPrint('Emitter is done after use case, cannot emit state');
      return;
    }

    // Process result outside fold callback to allow await
    BaseResponse<LoginResponseModel>? successData;
    String? errorMessage;

    result.fold(
      (failure) {
        errorMessage = failure.message;
      },
      (data) {
        successData = data as BaseResponse<LoginResponseModel>;
      },
    );

    // Handle error case
    if (errorMessage != null) {
      if (!emit.isDone) {
        emit(
          state.copyWith(
            representativeLoginRequestState: RequestState.error,
            representativeLoginResponse: BaseResponse<LoginResponseModel>(
              status: false,
              msg: errorMessage,
            ),
          ),
        );
      }
      return;
    }

    // Handle success case
    if (successData != null) {
      final data = successData!;
      debugPrint('LoginRepresentative success - status: ${data.status}');
      debugPrint('LoginRepresentative success - data: ${data.data != null}');
      debugPrint('LoginRepresentative success - msg: ${data.msg}');

      // Save login data if status is true and data exists
      if (data.status == true &&
          data.data != null &&
          data.data is LoginResponseModel) {
        debugPrint('Saving login data to storage');
        try {
          await sl<MainSecureStorage>().login(data.data!);
          debugPrint('Login data saved successfully');
        } catch (e, stackTrace) {
          debugPrint('Error saving login data: $e');
          debugPrint('Stack trace: $stackTrace');
          if (!emit.isDone) {
            emit(
              state.copyWith(
                representativeLoginRequestState: RequestState.error,
                representativeLoginResponse:
                    const BaseResponse<LoginResponseModel>(
                      status: false,
                      msg: 'حدث خطأ أثناء حفظ بيانات تسجيل الدخول',
                    ),
              ),
            );
          }
          return;
        }
      }

      // Check if emit is still valid after async operation
      if (emit.isDone) {
        debugPrint('Emitter is done after storage save, cannot emit state');
        return;
      }

      debugPrint('Emitting loaded state');
      emit(
        state.copyWith(
          representativeLoginRequestState: RequestState.loaded,
          representativeLoginResponse: data,
        ),
      );
      debugPrint('State emitted successfully');
    }
  }

  FutureOr<void> _startLogout(
    LogoutButtonPressedEvent event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(logoutRequestState: RequestState.loading));
    final result = await logoutUseCase(event.parameters);
    result.fold(
      (failure) async {
        await sl<MainSecureStorage>().logout();
        if (!emit.isDone) {
          emit(
            state.copyWith(
              logoutRequestState: RequestState.error,
              logoutResponse: BaseResponse(status: false, msg: failure.message),
            ),
          );
        }
      },
      (data) async {
        await sl<MainSecureStorage>().logout();
        if (!emit.isDone) {
          emit(
            state.copyWith(
              logoutRequestState: RequestState.loaded,
              logoutResponse: data,
            ),
          );
        }
      },
    );
  }

  FutureOr<void> _startDeleteAccount(
    DeleteAccountButtonPressedEvent event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(deleteAccountRequestState: RequestState.loading));
    final result = await deleteAccountUseCase(event.parameters);
    result.fold(
      (failure) async {
        await sl<MainSecureStorage>().logout();
        if (!emit.isDone) {
          emit(
            state.copyWith(
              deleteAccountRequestState: RequestState.error,
              deleteAccountResponse: BaseResponse(
                status: false,
                msg: failure.message,
              ),
            ),
          );
        }
      },
      (data) async {
        await sl<MainSecureStorage>().logout();
        if (!emit.isDone) {
          emit(
            state.copyWith(
              deleteAccountRequestState: RequestState.loaded,
              deleteAccountResponse: data,
            ),
          );
        }
      },
    );
  }

  FutureOr<void> _startVerify(
    VerifyButtonPressedEvent event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(verifyRequestState: RequestState.loading));
    final result = await verifyUseCase(event.parameters);
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            verifyRequestState: RequestState.error,
            verifyResponse: BaseResponse(status: false, msg: failure.message),
          ),
        );
      },
      (data) async {
        await sl<MainSecureStorage>().login(data.data!);
        if (!emit.isDone) {
          emit(
            state.copyWith(
              verifyRequestState: RequestState.loaded,
              verifyResponse: data,
            ),
          );
        }
      },
    );
  }

  FutureOr<void> _startResendCode(
    ResendCodeButtonPressedEvent event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(resendRequestState: RequestState.loading));
    final result = await resendCodeUseCase(event.parameters);
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            resendRequestState: RequestState.error,
            resendResponse: BaseResponse(status: false, msg: failure.message),
          ),
        );
      },
      (data) {
        emit(
          state.copyWith(
            resendRequestState: RequestState.loaded,
            resendResponse: data,
          ),
        );
      },
    );
  }
}
