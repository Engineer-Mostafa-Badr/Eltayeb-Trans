import 'package:flutter/material.dart';

class AddCustodyRecordPage extends StatelessWidget {
  const AddCustodyRecordPage({super.key});

  // Colors extracted from the image
  static const Color kPrimaryRed = Color(0xFF560000); // Dark Maroon
  static const Color kTextRed = Color(0xFF6D1B1B);
  static const Color kTextDarkBlue = Color(0xFF101828);
  static const Color kTextGray = Color(0xFF667085);
  static const Color kBorderGray = Color(0xFFEAECF0);
  static const Color kIconGray = Color(0xFF98A2B3);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: SafeArea(
        child: Column(
          children: [
            // --- Custom App Bar ---
            Container(
              height: 60,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Center Title
                  const Text(
                    'إضافة عهدة',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: kTextDarkBlue,
                    ),
                  ),
                  // Left and Right Actions
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Left Side: Back Button & Language Flag
                      Row(
                        children: [
                          _buildCircleButton(
                            icon: Icons.arrow_back,
                            iconSize: 22,
                            color: Colors.black,
                          ),
                          const SizedBox(width: 12),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.transparent),
                            ),
                            child: Row(
                              children: [
                                ClipOval(
                                  child: Container(
                                    width: 20,
                                    height: 20,
                                    color: Colors.white,
                                    alignment: Alignment.center,
                                    child: const Text(
                                      '🇪🇬',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 6),
                                const Text(
                                  'AR',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: kTextDarkBlue,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      // Right Side: Profile Icon
                      _buildCircleButton(
                        icon: Icons.person_outline,
                        iconSize: 22,
                        color: kTextRed,
                        backgroundColor: const Color(
                          0xFFF2F4F7,
                        ), // Slight gray bg for buttons
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // --- Body Content ---
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 24,
                ),
                child: Column(
                  children: [
                    // White Card
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 30,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.04),
                            blurRadius: 16,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // Card Title
                          const Text(
                            'ادخل العهدة',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: kTextRed,
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 40),

                          // Label "Amount"
                          const Text(
                            'المبلغ',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: kTextDarkBlue,
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 10),

                          // Input Container
                          Container(
                            height: 56,
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: kBorderGray),
                            ),
                            child: const Row(
                              children: [
                                // Left Suffix "Pounds"
                                Text(
                                  'جنيه',
                                  style: TextStyle(
                                    color: kTextDarkBlue,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Spacer(),
                                // Right Placeholder "0.00 $"
                                Text(
                                  '0.00',
                                  style: TextStyle(
                                    color: kIconGray,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(width: 6),
                                Text(
                                  r'$',
                                  style: TextStyle(
                                    color: kIconGray,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),

                    const SizedBox(height: 30),

                    // Action Button
                    SizedBox(
                      width: double.infinity,
                      height: 58,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: kPrimaryRed,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'إضافة العهدة',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCircleButton({
    required IconData icon,
    required double iconSize,
    required Color color,
    Color backgroundColor = Colors.white,
    Color borderColor = Colors.transparent,
  }) {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
        border: Border.all(color: borderColor),
      ),
      child: Icon(icon, size: iconSize, color: color),
    );
  }
}
