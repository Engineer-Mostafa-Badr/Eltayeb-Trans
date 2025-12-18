import '../../../../core/components/scaffold/shared_home_scaffold.dart';
import '../../../../core/extensions/widgets_extensions.dart';
import '../../../../core/utils/app_sizes.dart';
import '../widgets/notifications_tabs.dart';
import '../widgets/notification_card.dart';
import '../../../../core/enum/enums.dart';
import 'package:flutter/material.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  int selectedTab = 1;

  final List<AppNotification> _notifications = [
    AppNotification(
      id: 1,
      title: 'تم إضافة رحلة جديدة لك',
      body: 'رحلة رقم 1023 جاهزة للتنفيذ.',
      timeLabel: 'منذ 10 دقائق',
      type: NotificationType.trip,
      isRead: false,
    ),
    AppNotification(
      id: 3,
      title: 'طلب الصيانة قيد المراجعة',
      body:
          'تم استلام طلب الصيانة الخاص بك وجاري المراجعة من قبل القسم المختص.',
      timeLabel: 'منذ ساعة',
      type: NotificationType.maintenance,
      isRead: false,
    ),
    AppNotification(
      id: 4,
      title: 'تم رفض المصروف',
      body: 'يرجى إعادة إرفاق إيصال واضح للمصروف المقدم.',
      timeLabel: 'اليوم',
      type: NotificationType.expense,
      isRead: false,
    ),
    AppNotification(
      id: 8,
      title: 'تم الانتهاء من الصيانة',
      body: 'صيانة الشاحنة رقم 1234 اكتملت ويمكنك استلامها الآن.',
      timeLabel: 'منذ يومين',
      type: NotificationType.maintenance,
      isRead: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final all = _notifications;
    final unread = _notifications.where((n) => !n.isRead).toList();
    final read = _notifications.where((n) => n.isRead).toList();

    List<AppNotification> currentList;
    if (selectedTab == 0) {
      currentList = read;
    } else if (selectedTab == 1) {
      currentList = unread;
    } else {
      currentList = all;
    }

    return SharedHomeScaffold(
      title: 'notifications',
      haveShadow: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          NotificationsTabs(
            selectedTab: selectedTab,
            allCount: all.length,
            unreadCount: unread.length,
            readCount: read.length,
            onChanged: (index) {
              setState(() {
                selectedTab = index;
              });
            },
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppPadding.padding24,
              ),
              child: ListView.separated(
                itemCount: currentList.length,
                separatorBuilder: (_, _) => AppPadding.padding10.sizedHeight,
                itemBuilder: (context, index) {
                  final item = currentList[index];
                  return NotificationCard(notification: item);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
