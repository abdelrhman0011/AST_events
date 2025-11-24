import 'package:flutter/material.dart';
import 'registration_button.dart';
import 'dart:html' as html;


class RegistrationSection extends StatelessWidget { 
  const RegistrationSection({super.key});
  void openLink(String url) {
    html.window.open(url, '_blank'); 
  }

  @override
  Widget build(BuildContext context) {
    return Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RegistrationButton(
                    icon: Icons.directions_car,
                    title: 'Cars Registration',
                    description: 'Register here to join this great and exciting event',
                    gradient: const LinearGradient(colors: [Colors.yellow, Colors.amber]),
                    onTap: () {
                      openLink("https://forms.gle/drzR4MkCHaCzD8gA7");
                      
                    },
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  RegistrationButton(
                    icon: Icons.group,
                    title: 'Crowd Registration',
                    description: 'soon',
                    gradient: const LinearGradient(colors: [Colors.amber, Colors.orange]),
                    onTap: () {
                      
                    },
                  ),
                ],
              ),
            );
  }
}