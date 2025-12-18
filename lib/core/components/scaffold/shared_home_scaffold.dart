import 'package:eltyp_delivery/features/onboarding/presentation/widgets/background_widget.dart';
import 'package:eltyp_delivery/core/components/appbar/shared_app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eltyp_delivery/config/themes/styles.dart';
import 'package:eltyp_delivery/core/utils/app_sizes.dart';
import 'package:eltyp_delivery/core/res/app_images.dart';
import 'package:flutter/material.dart';
import '../utils/widgets.dart';

class SharedHomeScaffold extends StatelessWidget {
  const SharedHomeScaffold({
    super.key,
    this.title = '',
    required this.body,
    this.bottomNavigationBar,
    this.backgroundImage = AssetImagesPath.authBackground,
    this.haveShadow,
  });

  final bool? haveShadow;
  final String backgroundImage;
  final String title;
  final Widget body;
  final Widget? bottomNavigationBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: title == ''
          ? null
          : SharedAppBar(
              title: title,
              haveShadow: haveShadow,
              actions: [
                const LanguageSwitcherRow(text: 'AR'),
                if (Navigator.canPop(context))
                  IconButton(
                    onPressed: () {
                      if (Navigator.canPop(context)) {
                        Navigator.pop(context);
                      }
                    },
                    icon: const AssetSvgImage(AssetImagesPath.grayBackButton),
                  ),
              ],
            ),
      body: Stack(
        children: [
          BackgroundWidget(image: backgroundImage),
          SafeArea(child: body),
        ],
      ),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}

class LanguageSwitcherRow extends StatefulWidget {
  final String text;

  const LanguageSwitcherRow({super.key, required this.text});

  @override
  State<LanguageSwitcherRow> createState() => _LanguageSwitcherRowState();
}

class _LanguageSwitcherRowState extends State<LanguageSwitcherRow> {
  String _flag(String iso) => iso.toUpperCase().replaceAllMapped(
    RegExp('[A-Z]'),
    (m) => String.fromCharCode(m.group(0)!.codeUnitAt(0) + 127397),
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: 10.0,
        left: Navigator.canPop(context) ? 0 : 10,
      ),
      child: Row(
        children: [
          Text(
            widget.text,
            style: AppStyles.title700.copyWith(fontSize: AppFontSize.f16),
          ),
          const SizedBox(width: 5),
          Container(
            width: 35.w,
            height: 35.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: .15),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Center(
              child: Text(_flag('EG'), style: const TextStyle(fontSize: 17)),
            ),
          ),
        ],
      ),
    );
  }
}
