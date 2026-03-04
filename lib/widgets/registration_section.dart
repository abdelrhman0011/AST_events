import 'package:flutter/material.dart';
import 'dart:html' as html; // تم الرجوع إلى dart:html
import 'registration_button.dart';

class RegistrationSection extends StatelessWidget {
  const RegistrationSection({super.key});

  // تم الرجوع إلى دالة openLink التي تستخدم dart:html
  void openLink(String url) {
    html.AnchorElement(href: url)
      ..target = '_blank' // يفتح الرابط في نافذة/علامة تبويب جديدة
      ..rel = 'noopener'
      ..click();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isVerySmallScreen = constraints.maxWidth < 400;
        final double buttonSpacing = isVerySmallScreen ? 8 : 20;
        final double verticalPadding = isVerySmallScreen ? 12 : 32;

        return Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: verticalPadding),
          child: (constraints.maxWidth < 768)
              // --- واجهة الشاشات الصغيرة (الجوال) ---
              ? Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: RegistrationButton(
                        icon: Icons.directions_car,
                        title: 'Cars Registration',
                        description: 'Register here to join this great and exciting event',
                        gradient: const LinearGradient(
                            colors: [Color.fromARGB(255, 169, 169, 2), Color.fromARGB(255, 156, 117, 0)]),
                        onTap: () => openLink("https://forms.gle/drzR4MkCHaCzD8gA7" ),
                      ),
                    ),
                    SizedBox(height: buttonSpacing),
                    SizedBox(
                      width: double.infinity,
                      child: RegistrationButton(
                        icon: Icons.group,
                        title: 'Crowd Registration',
                        description: 'soon',
                        gradient: const LinearGradient(colors: [Colors.amber, Colors.orange]),
                        onTap: () {},
                      ),
                    ),
                    SizedBox(height: buttonSpacing),
                    SizedBox(
                      width: double.infinity,
                      child: RegistrationButton(
                        icon: Icons.camera_alt,
                        title: 'Photographer Registration',
                        description: 'Register here to join this great and exciting event',
                        gradient: const LinearGradient(colors: [Colors.orange, Colors.deepOrange]),
                        onTap: () {
                          
                          openLink("https://forms.gle/HUYTcw5mPwqaNtYy5" );}
                      ),
                    ),
                  ],
                )
              // --- واجهة الشاشات الكبيرة (الويب) ---
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      flex: 1,
                      child: RegistrationButton(
                        icon: Icons.directions_car,
                        title: 'Cars Registration',
                        description: 'Register here to join this great and exciting event',
                        gradient: const LinearGradient(
                            colors: [Color.fromARGB(255, 180, 180, 1), Color.fromARGB(255, 156, 117, 0)]),
                        onTap: () => openLink("https://forms.gle/drzR4MkCHaCzD8gA7" ),
                      ),
                    ),
                    SizedBox(width: buttonSpacing),
                    Flexible(
                      flex: 1,
                      child: RegistrationButton(
                        icon: Icons.group,
                        title: 'Crowd Registration',
                        description: 'soon',
                        gradient: const LinearGradient(colors: [Colors.amber, Colors.orange]),
                        onTap: () {},
                      ),
                    ),
                    SizedBox(width: buttonSpacing),
                    Flexible(
                      flex: 1,
                      child: RegistrationButton(
                        icon: Icons.camera_alt,
                        title: 'Photographer Registration',
                        description: 'soon',
                        gradient: const LinearGradient(colors: [Colors.orange, Colors.deepOrange]),
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }
}
