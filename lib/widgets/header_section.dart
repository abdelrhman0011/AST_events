import 'package:flutter/material.dart';
import 'event_information.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // حجم الشاشة
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 16),

          // Row المعلومات واللوجوهات
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // المعلومات على الشمال
              Expanded(
                child: Wrap(
                  spacing: 20,
                  alignment: WrapAlignment.start,
                  runSpacing: 10,
                  children: const [
                    EventInformation(icon: Icons.calendar_today, text: '27 march, 2026'),
                    EventInformation(icon: Icons.access_time, text: 'soon !!'),
                    EventInformation(icon: Icons.location_on, text: 'soon !!'),
                  ],
                ),
              ),

              // اللوجوهات على اليمين
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/logo2.webp',
                    width: screenWidth * 0.1, // responsive width
                  ),
                  const SizedBox(width: 20),
                  Image.asset(
                    'assets/logo3.webp',
                    width: screenWidth * 0.1,
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 20),

          // صورة البوستر
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              "assets/poster.png",
              width: screenWidth * 0.9, // 90% من عرض الشاشة
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
