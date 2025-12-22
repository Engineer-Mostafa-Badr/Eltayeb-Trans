import 'package:eltyp_delivery/core/extensions/widgets_extensions.dart';
import '../../../../core/utils/app_sizes.dart';
import '../widgets/notification_card.dart';
import '../../../../core/enum/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eltyp_delivery/features/notifications/presentation/bloc/notifications_bloc.dart';
import 'package:eltyp_delivery/features/notifications/data/models/notifications_model.dart';
import 'package:eltyp_delivery/features/injection_container.dart' as di;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/components/images/custom_asset_svg_image.dart';
import '../../../../core/res/app_images.dart';
import '../../../../config/themes/colors.dart';
import '../../../../core/extensions/navigation_extensions.dart';
import '../../../home/presentation/pages/trip_representative_page.dart';

class NotificationsRepresentativePage extends StatefulWidget {
  const NotificationsRepresentativePage({super.key});

  @override
  State<NotificationsRepresentativePage> createState() =>
      _NotificationsRepresentativePageState();
}

class _NotificationsRepresentativePageState
    extends State<NotificationsRepresentativePage> {
  final ScrollController _scrollController = ScrollController();
  BuildContext? _blocContext;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_blocContext == null) return;

    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.8) {
      final state = _blocContext!.read<NotificationsBloc>().state;
      final pagination = state.getNotificationsResponse.pagination;
      if (pagination != null &&
          pagination.currentPage < pagination.lastPage &&
          state.getNotificationsState == RequestState.loaded) {
        _blocContext!.read<NotificationsBloc>().add(
          NotificationsFetchEvent(
            params: state.getNotificationsParameters.copyWith(
              page: pagination.currentPage + 1,
            ),
          ),
        );
      }
    }
  }

  AppNotification _convertToAppNotification(NotificationsModel model) {
    // Convert notification type string to NotificationType enum
    NotificationType type = NotificationType.appUpdate;
    switch (model.type.toLowerCase()) {
      case 'trip':
      case 'trips':
        type = NotificationType.trip;
        break;
      case 'maintenance':
        type = NotificationType.maintenance;
        break;
      case 'expense':
      case 'expenses':
        type = NotificationType.expense;
        break;
      default:
        type = NotificationType.appUpdate;
    }

    // Check if notification is read
    final isRead = model.seenAt.isNotEmpty;

    // Format time label
    final String timeLabel = model.createdAtHuman.isNotEmpty
        ? model.createdAtHuman
        : _formatDateTime(model.createdAt);

    return AppNotification(
      id: model.id,
      title: model.title,
      body: model
          .title, // Using title as body since API doesn't provide separate body
      timeLabel: timeLabel,
      type: type,
      isRead: isRead,
    );
  }

  String _formatDateTime(String dateTimeString) {
    try {
      final dateTime = DateTime.parse(dateTimeString);
      final now = DateTime.now();
      final difference = now.difference(dateTime);

      if (difference.inDays > 7) {
        return '${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}';
      } else if (difference.inDays > 0) {
        return 'منذ ${difference.inDays} ${difference.inDays == 1 ? 'يوم' : 'أيام'}';
      } else if (difference.inHours > 0) {
        return 'منذ ${difference.inHours} ${difference.inHours == 1 ? 'ساعة' : 'ساعات'}';
      } else if (difference.inMinutes > 0) {
        return 'منذ ${difference.inMinutes} ${difference.inMinutes == 1 ? 'دقيقة' : 'دقائق'}';
      } else {
        return 'الآن';
      }
    } catch (e) {
      return dateTimeString;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          di.sl<NotificationsBloc>()..add(const NotificationsFetchEvent()),
      child: BlocConsumer<NotificationsBloc, NotificationsState>(
        listener: (context, state) {
          // Handle errors
          if (state.getNotificationsState == RequestState.error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.getNotificationsResponse.msg ??
                      'حدث خطأ في تحميل الإشعارات',
                  style: const TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.red,
                duration: const Duration(seconds: 3),
              ),
            );
          }

          // Handle read notification errors
          if (state.readNotificationState == RequestState.error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.readNotificationResponse.msg ??
                      'حدث خطأ في قراءة الإشعار',
                  style: const TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.red,
                duration: const Duration(seconds: 2),
              ),
            );
          }

          // Handle read all notifications errors
          if (state.readAllNotificationsState == RequestState.error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.readAllNotificationsResponse.msg ??
                      'حدث خطأ في قراءة جميع الإشعارات',
                  style: const TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.red,
                duration: const Duration(seconds: 2),
              ),
            );
          }
        },
        builder: (context, state) {
          // Save the context from BlocConsumer builder to use in _onScroll
          _blocContext = context;

          final notifications = state.getNotificationsResponse.data ?? [];
          final isLoading = state.getNotificationsState == RequestState.loading;
          final hasError = state.getNotificationsState == RequestState.error;
          final isInitialLoad = isLoading && notifications.isEmpty;

          // Convert all notifications to AppNotification
          final appNotifications = notifications
              .map((n) => _convertToAppNotification(n))
              .toList();

          return Column(
            children: [
              const NotificationsHeader(),
              Expanded(
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppPadding.padding24,
                    ),
                    child: isInitialLoad
                        ? const Center(child: CircularProgressIndicator())
                        : hasError && notifications.isEmpty
                        ? Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.error_outline,
                                  size: 48,
                                  color: Colors.red,
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  state.getNotificationsResponse.msg ??
                                      'حدث خطأ في تحميل الإشعارات',
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 16),
                                ElevatedButton(
                                  onPressed: () {
                                    context.read<NotificationsBloc>().add(
                                      const NotificationsFetchEvent(),
                                    );
                                  },
                                  child: const Text('إعادة المحاولة'),
                                ),
                              ],
                            ),
                          )
                        : appNotifications.isEmpty
                        ? const Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.notifications_none,
                                  size: 64,
                                  color: Colors.grey,
                                ),
                                SizedBox(height: 16),
                                Text(
                                  'لا توجد إشعارات',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : ListView.separated(
                            controller: _scrollController,
                            padding: const EdgeInsets.only(top: 16),
                            itemCount:
                                appNotifications.length +
                                (isLoading && notifications.isNotEmpty ? 1 : 0),
                            separatorBuilder: (_, _) =>
                                AppPadding.padding10.sizedHeight,
                            itemBuilder: (context, index) {
                              if (index == appNotifications.length) {
                                return const Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: CircularProgressIndicator(),
                                  ),
                                );
                              }
                              final item = appNotifications[index];
                              return GestureDetector(
                                onTap: () {
                                  // Mark notification as read
                                  if (!item.isRead) {
                                    context.read<NotificationsBloc>().add(
                                      ReadNotificationEvent(item.id),
                                    );
                                  }
                                },
                                child: NotificationCard(notification: item),
                              );
                            },
                          ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

// Header for Notifications Page
class NotificationsHeader extends StatefulWidget {
  const NotificationsHeader({super.key});

  @override
  State<NotificationsHeader> createState() => _NotificationsHeaderState();
}

class _NotificationsHeaderState extends State<NotificationsHeader> {
  String? _selectedGovernorate;

  final List<String> _governorates = [
    'القاهرة',
    'الإسكندرية',
    'الجيزة',
    'بورسعيد',
    'السويس',
    'طنطا',
    'أسيوط',
    'الأقصر',
    'أسوان',
    'دمياط',
    'المنيا',
    'بنها',
    'قنا',
    'سوهاج',
    'دمنهور',
    'الغربيه',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        width: double.infinity,
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Left side: Location dropdown
            PopupMenuButton<String>(
              offset: const Offset(0, 50),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Location icon first
                  Container(
                    padding: EdgeInsets.only(right: 15.r, left: 4.r),
                    child: CustomAssetSvgImage(
                      AssetImagesPath.LocationSvg,
                      height: 16.h,
                    ),
                  ),
                  // Governorate name next to location icon
                  Padding(
                    padding: EdgeInsets.only(top: 7.h),
                    child: Text(
                      _selectedGovernorate ?? 'الغربيه',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: _selectedGovernorate != null
                            ? Colors.black
                            : Colors.grey.shade600,
                        fontWeight: _selectedGovernorate != null
                            ? FontWeight.w600
                            : FontWeight.normal,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(width: 1.w),
                  // Dropdown arrow icon last
                  Padding(
                    padding: EdgeInsets.only(top: 5.h),
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      size: 16.sp,
                      color: AppColors.cPrimary,
                    ),
                  ),
                ],
              ),
              itemBuilder: (BuildContext context) {
                return _governorates.map((String governorate) {
                  return PopupMenuItem<String>(
                    value: governorate,
                    child: Text(
                      governorate,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: _selectedGovernorate == governorate
                            ? AppColors.cPrimary
                            : Colors.black,
                        fontWeight: _selectedGovernorate == governorate
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                  );
                }).toList();
              },
              onSelected: (String value) {
                setState(() {
                  _selectedGovernorate = value;
                });
              },
            ),

            // Right side: Back button icon with circle
            GestureDetector(
              onTap: () {
                // Navigate to trips page
                context.navigateToPageWithClearStack(
                  const TripsRepresentativePage(initialIndex: 0),
                );
              },
              child: Container(
                width: 40.w,
                height: 40.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[100],
                ),
                child: Center(
                  child: CustomAssetSvgImage(
                    AssetImagesPath.IconSvg,
                    height: 20.h,
                    width: 20.w,
                    color: AppColors.cPrimary,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
