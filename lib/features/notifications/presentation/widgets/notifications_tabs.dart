import '../../../../config/themes/colors.dart';
import 'package:flutter/material.dart';
import 'tab_item.dart';

class NotificationsTabs extends StatelessWidget {
  final int selectedTab;
  final int allCount;
  final int unreadCount;
  final int readCount;
  final ValueChanged<int> onChanged;

  const NotificationsTabs({
    super.key,
    required this.selectedTab,
    required this.allCount,
    required this.unreadCount,
    required this.readCount,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(child: Container(color: Colors.white)),
        Container(
          margin: const EdgeInsets.only(left: 23, right: 23, bottom: 17),
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          decoration: BoxDecoration(
            color: AppColors.cNotificationTap,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Row(
            children: [
              TabItem(
                text: 'all',
                count: allCount,
                isSelected: selectedTab == 2,
                onTap: () => onChanged(2),
              ),
              TabItem(
                text: 'unread',
                count: unreadCount,
                isSelected: selectedTab == 1,
                onTap: () => onChanged(1),
              ),
              TabItem(
                text: 'read',
                count: readCount,
                isSelected: selectedTab == 0,
                onTap: () => onChanged(0),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
