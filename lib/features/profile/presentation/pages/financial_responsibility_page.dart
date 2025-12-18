import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../config/themes/styles.dart';
import '../../../../core/components/scaffold/shared_home_scaffold.dart';
import '../../../../core/enum/enums.dart';
import '../../../../core/extensions/widgets_extensions.dart';
import '../../../../core/utils/app_sizes.dart';
import '../widgets/financial_responsibility_widets/financial_movement_card.dart';
import '../widgets/financial_responsibility_widets/financial_summary_card.dart';

class FinancialReturnPage extends StatelessWidget {
  const FinancialReturnPage({super.key});

  @override
  Widget build(BuildContext context) {
    final movements = _dummyMovements;

    const totalReceived = 3700.0;
    const totalExpenses = 2150.0;
    const remaining = 850.0;

    return SharedHomeScaffold(
      title: 'financial_return',
      body: Padding(
        padding: const EdgeInsets.only(
          top: AppPadding.padding24,
          right: AppPadding.padding20,
          left: AppPadding.padding20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const FinancialSummaryCard(
              totalReceived: totalReceived,
              totalExpenses: totalExpenses,
              remaining: remaining,
            ),
            AppPadding.padding24.sizedHeight,
            Text(
              'movements_details',
              style: AppStyles.title700.copyWith(fontSize: AppFontSize.f18),
            ).tr(),
            AppPadding.padding16.sizedHeight,
            Expanded(
              child: ListView.separated(
                itemCount: movements.length,
                separatorBuilder: (_, _) => AppPadding.padding12.sizedHeight,
                itemBuilder: (context, index) => FinancialMovementCard(movement: movements[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FinancialMovement {
  final String title;
  final String dateLabel;
  final String? tripLabel;
  final double amount;
  final bool isIncome;
  final String statusKey;
  final FinancialMovementType type;

  FinancialMovement({
    required this.title,
    required this.dateLabel,
    required this.amount,
    required this.isIncome,
    required this.statusKey,
    required this.type,
    this.tripLabel,
  });
}

final List<FinancialMovement> _dummyMovements = [
  FinancialMovement(
    title: 'إضافة عهده',
    dateLabel: '15 نوفمبر 2025',
    amount: 3000,
    isIncome: true,
    statusKey: 'received_return_status',
    type: FinancialMovementType.returnAdd,
  ),
  FinancialMovement(
    title: 'خصم مصروف - ديزل',
    dateLabel: '14 نوفمبر 2025',
    tripLabel: 'رحلة رقم 1023',
    amount: 850,
    isIncome: false,
    statusKey: 'recorded_expense_status',
    type: FinancialMovementType.fuel,
  ),
  FinancialMovement(
    title: 'خصم مصروف - صيانة',
    dateLabel: '13 نوفمبر 2025',
    tripLabel: 'رحلة رقم 1019',
    amount: 600,
    isIncome: false,
    statusKey: 'recorded_expense_status',
    type: FinancialMovementType.maintenance,
  ),
  FinancialMovement(
    title: 'خصم مصروف - ديزل',
    dateLabel: '12 نوفمبر 2025',
    tripLabel: 'رحلة رقم 1014',
    amount: 250,
    isIncome: false,
    statusKey: 'recorded_expense_status',
    type: FinancialMovementType.fuel,
  ),
  FinancialMovement(
    title: 'خصم مصروف - ديزل',
    dateLabel: '12 نوفمبر 2025',
    tripLabel: 'رحلة رقم 1014',
    amount: 250,
    isIncome: false,
    statusKey: 'recorded_expense_status',
    type: FinancialMovementType.fuel,
  ),
  FinancialMovement(
    title: 'خصم مصروف - ديزل',
    dateLabel: '12 نوفمبر 2025',
    tripLabel: 'رحلة رقم 1014',
    amount: 250,
    isIncome: false,
    statusKey: 'recorded_expense_status',
    type: FinancialMovementType.fuel,
  ),
];
