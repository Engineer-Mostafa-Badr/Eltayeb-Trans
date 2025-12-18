import 'package:eltyp_delivery/core/extensions/widgets_extensions.dart';
import 'package:eltyp_delivery/features/profile/presentation/widgets/technical_support/ticket_input_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/themes/colors.dart';
import '../../../../core/components/buttons/outlined_button.dart';
import '../../../../core/components/scaffold/shared_home_scaffold.dart';
import '../../../../core/utils/app_sizes.dart';
import '../widgets/technical_support/ticket_details_header_card.dart';
import '../widgets/technical_support/ticket_message_bubble.dart';

class TicketDetailsPage extends StatelessWidget {
  const TicketDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final messages = <TicketMessage>[
      const TicketMessage(
        text:
            'عندي مشكلة في تحميل مستندات السائق، كل ما أحاول أرفع بيظهر لي خطأ',
        time: 'ص 08:32',
        isFromUser: true,
      ),
      const TicketMessage(
        text:
            'شكراً لتواصلك معنا، سنقوم بمراجعة سجلات النظام للتأكد من المشكلة.',
        time: 'ص 09:15',
        isFromUser: false,
      ),
      const TicketMessage(
        text: 'تم تحديث إعدادات الرفع في النظام، برجاء المحاولة مرة أخرى',
        time: 'ص 10:20',
        isFromUser: false,
      ),
      const TicketMessage(
        text: 'ما زالت تظهر نفس المشكلة.',
        time: 'ص 11:05',
        isFromUser: true,
      ),
      const TicketMessage(
        text:
            'يرجى التأكد من أن حجم الصورة لا يتجاوز 5 ميجابايت، وأن لديك اتصال إنترنت مستقر.',
        time: 'ص 11:30',
        isFromUser: false,
      ),
      const TicketMessage(
        text: 'تم الرفع، شكراً لكم.',
        time: 'م 12:15',
        isFromUser: true,
      ),
    ];

    return SharedHomeScaffold(
      bottomNavigationBar: const TicketInputBar(),
      title: 'ticket_details',
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: AppPadding.padding30,
                vertical: AppPadding.padding16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const TicketDetailsHeaderCard(),
                  AppPadding.padding24.sizedHeight,
                  Column(
                    children: List.generate(
                      messages.length,
                      (index) => Padding(
                        padding: EdgeInsets.only(
                          bottom: index == messages.length - 1
                              ? 0
                              : AppPadding.padding18,
                        ),
                        child: TicketMessageBubble(message: messages[index]),
                      ),
                    ),
                  ),
                  AppPadding.padding32.sizedHeight,
                  ReusedOutlinedButton(
                    height: 52.h,
                    text: 'close_ticket',
                    onPressed: () {},
                    color: Colors.white,
                    borderColor: AppColors.cProfileRed,
                    textColor: AppColors.cProfileRed,
                    fontSize: AppFontSize.f16,
                  ),
                  AppPadding.padding24.sizedHeight,
                  80.sizedHeight,
                ],
              ),
            ),
          ),
          // const TicketInputBar(),
        ],
      ),
    );
  }
}

class TicketMessage {
  final String text;
  final String time;
  final bool isFromUser;

  const TicketMessage({
    required this.text,
    required this.time,
    required this.isFromUser,
  });
}
