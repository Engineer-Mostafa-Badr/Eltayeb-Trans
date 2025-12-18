import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final Widget? title;
  final List<Widget>? actions;
  final Color backgroundColor;
  final double elevation;
  final bool centerTitle;
  final double toolbarHeight;

  const CustomAppBar({
    super.key,
    this.leading,
    this.title,
    this.actions,
    this.backgroundColor = Colors.white,
    this.elevation = 0,
    this.centerTitle = false,
    this.toolbarHeight = kToolbarHeight,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading,
      title: title,
      actions: actions,
      backgroundColor: backgroundColor,
      elevation: elevation,
      centerTitle: centerTitle,
      toolbarHeight: toolbarHeight,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight);
}

class RepresentativeAppBar extends StatelessWidget {
  final VoidCallback? onNotificationTap;
  final int notificationCount;
  final String languageCode;
  final String flagUrl;
  final String logoUrl;
  final Widget? leading;

  const RepresentativeAppBar({
    super.key,
    this.onNotificationTap,
    this.notificationCount = 0,
    this.languageCode = 'AR',
    this.flagUrl = 'https://flagcdn.com/w40/eg.png',
    this.logoUrl = 'https://placeholder.com/logo_eltayeb',
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          leading ??
              const CircleAvatar(
                backgroundColor: Color(0xFFF2F2F2),
                child: Icon(Icons.person_outline, color: Color(0xFF4A0000)),
              ),
          Image.network(
            logoUrl,
            height: 40,
            errorBuilder: (context, error, stackTrace) => const Text(
              'ELTAYEB',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          Row(
            children: [
              Text(
                languageCode,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 4),
              ClipOval(
                child: Image.network(
                  flagUrl,
                  width: 24,
                  height: 24,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              GestureDetector(
                onTap: onNotificationTap,
                child: Stack(
                  children: [
                    const Icon(Icons.notifications_none_outlined, size: 28),
                    if (notificationCount > 0)
                      Positioned(
                        right: 0,
                        top: 0,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: Color(0xFF9B1B1B),
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            notificationCount.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
