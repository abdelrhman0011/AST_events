import 'package:flutter/material.dart';

class GallerySection extends StatelessWidget {
  const GallerySection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Gallery',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              'assets/cars1.jpg',
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 16),
          GridView.count(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 3,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 1.5,
            children: [
              Image.asset('assets/car2.jpg', fit: BoxFit.cover),
              Image.asset('assets/car3.jpg', fit: BoxFit.cover),
              Image.asset('assets/car6.jpg', fit: BoxFit.cover),
              Image.asset('assets/car7.jpg', fit: BoxFit.cover),
              Image.asset('assets/car8.jpg', fit: BoxFit.cover),
              Image.asset('assets/car9.jpg', fit: BoxFit.cover),
              Image.asset('assets/car10.jpg', fit: BoxFit.cover),
              Image.asset('assets/car11.jpg', fit: BoxFit.cover),
              Image.asset('assets/car12.jpg', fit: BoxFit.cover),
              Image.asset('assets/car13.jpg', fit: BoxFit.cover),
               Image.asset('assets/car6.jpg', fit: BoxFit.cover),
              Image.asset('assets/car14.jpg', fit: BoxFit.cover),
               
            ],
          ),
        ],
      ),
    );
  }
}
