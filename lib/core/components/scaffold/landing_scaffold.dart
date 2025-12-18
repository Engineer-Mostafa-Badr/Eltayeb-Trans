import 'package:easy_localization/easy_localization.dart' as tr;
import 'package:flutter/material.dart';
import 'package:eltyp_delivery/core/components/utils/widgets.dart';
import 'package:eltyp_delivery/core/extensions/widgets_extensions.dart';
import 'package:eltyp_delivery/core/res/app_images.dart';
import 'package:eltyp_delivery/core/utils/app_sizes.dart';
import 'package:eltyp_delivery/features/onboarding/presentation/widgets/background_widget.dart';

class LandingScaffold extends StatelessWidget {
  const LandingScaffold({
    super.key,
    this.title = '',
    required this.body,
    this.bottomNavigationBar,
    this.assetSVG,
    this.actions,
    this.backgroundImage = AssetImagesPath.authBackground,
    this.showBackButton = false,
    this.showBottomLine = true,
    this.centerTitle = false,
    this.drawer,
    this.scaffoldKey,
    this.leading,
    this.titleFontSize,
    this.lineWidget,
    this.backgroundColor,
  });

  final String backgroundImage;
  final String title;
  final String? assetSVG;
  final Widget body;
  final Widget? bottomNavigationBar;
  final Widget? drawer;
  final Widget? lineWidget;
  final Widget? leading;
  final List<Widget>? actions;
  final bool showBottomLine;
  final bool showBackButton;
  final bool centerTitle;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final double? titleFontSize;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      // backgroundColor: Colors.transparent,
      backgroundColor: backgroundColor,
      key: scaffoldKey,
      drawer: drawer,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leading:
            leading ??
            (assetSVG != null
                ? FittedBox(
                    fit: BoxFit.scaleDown,
                    child: AssetSvgImage(assetSVG!),
                  )
                : null),
        title: Text(
          title,
          style: Theme.of(
            context,
          ).appBarTheme.titleTextStyle?.copyWith(fontSize: titleFontSize),
        ).tr(),
        centerTitle: centerTitle,
        titleSpacing: assetSVG != null ? 4 : 24,
        actions: [
          if (actions != null) ...actions!,
          if (showBackButton && Navigator.canPop(context)) ...[
            Directionality(
              textDirection: TextDirection.ltr,
              child: BackButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(
                    Colors.white.withValues(alpha: .1),
                  ),
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.white.withValues(alpha: .3),
                        width: 1.4,
                      ),
                      borderRadius: BorderRadius.circular(
                        AppBorderRadius.radius14,
                      ),
                    ),
                  ),
                ),
                color: Colors.white,
              ),
            ),
            AppPadding.smallPadding.sizedWidth,
          ],
        ],
        bottom: showBottomLine
            ? PreferredSize(
                preferredSize: const Size.fromHeight(1),
                child:
                    lineWidget ??
                    Container(
                      color: Colors.white,
                      height: 1,
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                    ),
              )
            : null,
      ),
      body: Stack(
        children: [
          if (backgroundColor == null) BackgroundWidget(image: backgroundImage),
          SafeArea(child: body),
        ],
      ),
      bottomSheet: bottomNavigationBar,
    );
  }
}
