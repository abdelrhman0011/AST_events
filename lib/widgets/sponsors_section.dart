// ignore_for_file: library_private_types_in_public_api

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SponsorsSection extends StatefulWidget {
  const SponsorsSection({super.key});

  @override
  _SponsorsSectionState createState() => _SponsorsSectionState();
}

class _SponsorsSectionState extends State<SponsorsSection> {
  final PageController _pageController = PageController(viewportFraction: 0.3);
  int _currentIndex = 0;
  Timer? _timer;
  bool _isDragging = false;

  final List<String> sponsorLogos = [
    'assets/logo.png',
    'assets/sponser1.svg',
    'assets/sponser2.svg',
    'assets/sponser3.svg',
    'assets/sponser4.svg',
    'assets/sponser5.svg',
  ];

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      if (!_isDragging) {
        _nextPage();
      }
    });
  }

  void _nextPage() {
    if (_currentIndex < sponsorLogos.length - 1) {
      _currentIndex++;
    } else {
      _currentIndex = 0;
      _pageController.jumpToPage(0);
      return;
    }

    _pageController.animateToPage(
      _currentIndex,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void _previousPage() {
    if (_currentIndex > 0) {
      _currentIndex--;
    } else {
      _currentIndex = sponsorLogos.length - 1;
    }

    _pageController.animateToPage(
      _currentIndex,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(
            'Our Sponsors',
            style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        SizedBox(
          height: 100,
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                onPressed: _previousPage,
              ),
              Expanded(
                child: NotificationListener<ScrollNotification>(
                  onNotification: (notification) {
                    if (notification is ScrollStartNotification) {
                      _isDragging = true;
                      _timer?.cancel();
                    } else if (notification is ScrollEndNotification) {
                      _isDragging = false;
                      _startAutoScroll();
                    }
                    return false;
                  },
                  child: PageView.builder(
                    controller: _pageController,
                    scrollDirection: Axis.horizontal,
                    itemCount: sponsorLogos.length,
                    onPageChanged: (index) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      final logo = sponsorLogos[index];
                      final isSvg = logo.toLowerCase().endsWith('.svg');

                      return AnimatedBuilder(
                        animation: _pageController,
                        builder: (context, child) {
                          double value = 1.0;
                          if (_pageController.position.haveDimensions) {
                            value = ((_pageController.page ??
                                        _pageController.initialPage) -
                                    index)
                                .toDouble();
                            value = (1 - (value.abs() * 0.5))
                                .clamp(0.0, 1.0)
                                .toDouble();
                          }

                          return Center(
                            child: Opacity(
                              opacity: value,
                              child: Transform.scale(
                                scale: value,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: isSvg
                                      ? SvgPicture.asset(
                                          logo,
                                          height: 100,
                                          fit: BoxFit.contain,
                                        )
                                      : Image.asset(
                                          logo,
                                          height: 100,
                                          fit: BoxFit.contain,
                                        ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.arrow_forward_ios, color: Colors.white),
                onPressed: _nextPage,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
