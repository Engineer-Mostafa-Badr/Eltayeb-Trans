import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:eltyp_delivery/core/components/utils/widgets.dart';

class ErrorBody extends StatelessWidget {
  const ErrorBody({
    super.key,
    this.errorMessage,
    this.fillRemaining,
    this.emptyImage,
  });

  final String? errorMessage;
  final String? emptyImage;
  final bool? fillRemaining;

  @override
  Widget build(BuildContext context) {
    if (fillRemaining != null) {
      return SliverFillRemaining(
        // hasScrollBody: false,
        child: _BaseErrorBody(
          errorMessage: errorMessage,
          emptyImage: emptyImage,
        ),
      );
    }

    return _BaseErrorBody(errorMessage: errorMessage, emptyImage: emptyImage);
  }
}

class _BaseErrorBody extends StatelessWidget {
  const _BaseErrorBody({this.errorMessage, this.emptyImage});

  final String? errorMessage;
  final String? emptyImage;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (emptyImage != null)
          AssetSvgImage(emptyImage!)
        else
          const MyAppLogo(),
        const SizedBox(height: 20),
        Text(
          (errorMessage ?? 'something_went_wrong').tr(),
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color(0xff8F8E71),
          ),
        ).tr(),
      ],
    );
  }
}
