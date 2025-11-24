import 'package:flutter/material.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'About the Event',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "For the third consecutive time, the AST Events is being held, bringing together modified and sports cars, motorcycles, and some of the most successful teams in the automotive field, along with well-known and beloved personalities. The event also features a selection of leading companies in the automotive world, offering special services and exclusive deals to delight attendees.\n\n"
              "A powerful and exceptional event for all car and motorcycle enthusiasts... An event truly worth attending and experiencing for every adrenaline lover!\n\n"
              "The event showcases more than 250 cars and motorcycles, featuring some of the finest vehicles in Egypt.",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
                height: 1.5, 
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),    
                    child: Center(
                      child: Image.asset(
                        "assets/poster.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                
              ],
            ),
          ],
        ),
      ),
    );
  }
}