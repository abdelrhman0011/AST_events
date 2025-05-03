import 'package:flutter/material.dart';
import 'event_information.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Meet. Compete. Dominate!',
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      foreground: Paint()
                        ..shader = const LinearGradient(
                          colors: [Colors.yellow, Colors.amber, Colors.orange],
                        ).createShader(const Rect.fromLTWH(0, 0, 200, 70)),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 20,
                    alignment: WrapAlignment.center,
                    children: [
                      EventInformation(icon: Icons.calendar_today, text: '11 july, 2025'),
                      EventInformation(icon: Icons.access_time, text: '3PM - 10PM'),
                      EventInformation(icon: Icons.location_on, text: 'cairo  '),
                     // EventInformation(icon: Icons.confirmation_number, text: '150 - 300'),
                    ],
                  ),
                ],
              ),
            );

}}
