import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'dart:html' as html;

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  void openLink(String url) {
    html.window.open(url, '_blank'); 
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            Color(0xFF1A1A1A),
            Color(0xFF232323),
          ],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Event Organizer',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'AST Events',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Support',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'astevent22@gmail.com',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 4),
              const Text(
                '+201015791072', 
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.facebook, color: Colors.grey),
                onPressed: () => openLink("https://www.facebook.com/share/18e4XjYVzw/"),
              ),
              IconButton(
                icon: const Icon(Iconsax.instagram, color: Colors.grey),
                onPressed: () => openLink("https://www.instagram.com/ast_events_?igsh=MXVnNmE4NjRhNWp1ZQ=="),
              ),
              GestureDetector(
                onTap: () => openLink("https://www.tiktok.com/@ast6544?_t=ZS-8uor7R6O2Z6&_r=1"),
                child: Image.asset(
                  "assets/icons8-tiktok-50.png",
                  width: 28,
                  height: 28,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}