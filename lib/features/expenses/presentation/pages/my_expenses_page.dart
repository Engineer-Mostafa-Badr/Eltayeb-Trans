import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/components/scaffold/shared_home_scaffold.dart';
import '../../../../core/extensions/widgets_extensions.dart';
import '../../../../core/utils/app_sizes.dart';
import '../widgets/expense_card.dart';
import '../widgets/expenses_summary_card.dart';
import '../widgets/expenses_tabs.dart';

enum ExpenseStatus { underReview, accepted, rejected }

class ExpenseItem {
  final String title;
  final String tripNumberLabel;
  final String dateLabel;
  final double amount;
  final String currency;
  final ExpenseStatus status;
  final bool hasImage;

  ExpenseItem({
    required this.title,
    required this.tripNumberLabel,
    required this.dateLabel,
    required this.amount,
    required this.currency,
    required this.status,
    this.hasImage = true,
  });
}

class MyExpensesPage extends StatefulWidget {
  const MyExpensesPage({super.key});

  @override
  State<MyExpensesPage> createState() => _MyExpensesPageState();
}

class _MyExpensesPageState extends State<MyExpensesPage> {
  int selectedTab = 1;

  final List<ExpenseItem> _items = [
    ExpenseItem(
      title: 'ديزل',
      tripNumberLabel: 'رحلة رقم 1023',
      dateLabel: '12 نوفمبر 2025',
      amount: 850,
      currency: 'ج.م',
      status: ExpenseStatus.underReview,
    ),
    ExpenseItem(
      title: 'غسيل الشاحنة',
      tripNumberLabel: 'رحلة رقم 1017',
      dateLabel: '6 نوفمبر 2025',
      amount: 150,
      currency: 'ج.م',
      status: ExpenseStatus.underReview,
    ),
    ExpenseItem(
      title: 'صيانة سريعة',
      tripNumberLabel: 'رحلة رقم 1020',
      dateLabel: '9 نوفمبر 2025',
      amount: 450,
      currency: 'ج.م',
      status: ExpenseStatus.rejected,
    ),
    ExpenseItem(
      title: 'كاوتش',
      tripNumberLabel: 'رحلة رقم 1022',
      dateLabel: '10 نوفمبر 2025',
      amount: 1200,
      currency: 'ج.م',
      status: ExpenseStatus.accepted,
    ),
    ExpenseItem(
      title: 'مصروف طريق',
      tripNumberLabel: 'رحلة رقم 1019',
      dateLabel: '8 نوفمبر 2025',
      amount: 350,
      currency: 'ج.م',
      status: ExpenseStatus.accepted,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final totalAmount = _items.fold<double>(0, (p, e) => p + e.amount);
    final totalCount = _items.length;

    List<ExpenseItem> currentList;
    if (selectedTab == 0) {
      currentList = _items;
    } else if (selectedTab == 1) {
      currentList = _items.where((e) => e.status == ExpenseStatus.underReview).toList();
    } else if (selectedTab == 2) {
      currentList = _items.where((e) => e.status == ExpenseStatus.accepted).toList();
    } else {
      currentList = _items.where((e) => e.status == ExpenseStatus.rejected).toList();
    }

    return SharedHomeScaffold(
      title: 'my_expenses',
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.padding30, vertical: AppPadding.padding16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ExpensesSummaryCard(totalAmount: totalAmount, totalCount: totalCount),
            AppPadding.padding16.sizedHeight,
            ExpensesTabs(
              selectedIndex: selectedTab,
              onChanged: (index) {
                setState(() {
                  selectedTab = index;
                });
              },
            ),
            AppPadding.padding16.sizedHeight,
            Expanded(
              child: ListView.separated(
                itemCount: currentList.length,
                separatorBuilder: (_, _) => AppPadding.padding12.sizedHeight,
                itemBuilder: (context, index) {
                  return ExpenseCard(item: currentList[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
