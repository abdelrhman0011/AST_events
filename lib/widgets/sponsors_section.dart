import 'dart:async';
import 'package:flutter/material.dart';

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
    'assets/sponser1.webp',
    'assets/sponser6.webp',
    "assets/logo4.webp",
    "assets/sponser3.webp",
    "assets/sposer4.webp",
    // أضف المزيد من اللوجوهات هنا
  ];

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      if (!_isDragging) _nextPage();
    });
  }

  void _nextPage() {
    if (!mounted) return;
    int nextPage = _currentIndex + 1;
    if (nextPage >= sponsorLogos.length) {
      nextPage = 0;
      _pageController.jumpToPage(0);
    } else {
      _pageController.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
    if (mounted) {
      setState(() {
        _currentIndex = nextPage;
      });
    }
  }

  void _previousPage() {
    if (!mounted) return;
    int prevPage = _currentIndex - 1;
    if (prevPage < 0) {
      prevPage = sponsorLogos.length - 1;
    }
    _pageController.animateToPage(
      prevPage,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
    if (mounted) {
      setState(() {
        _currentIndex = prevPage;
      });
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final availableWidth = constraints.maxWidth;
        final logoHeight = availableWidth * 0.35;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                'Our Sponsors',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: logoHeight,
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                    onPressed: _previousPage,
                  ),
                  Flexible(
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
                          if (mounted) {
                            setState(() {
                              _currentIndex = index;
                            });
                          }
                        },
                        itemBuilder: (context, index) {
                          final logo = sponsorLogos[index];

                          return AnimatedBuilder(
                            animation: _pageController,
                            builder: (context, child) {
                              double value = 1.0;
                              if (_pageController.hasClients &&
                                  _pageController.position.haveDimensions) {
                                value = (((_pageController.page ??
                                            _pageController.initialPage) -
                                        index)
                                    .abs())
                                .toDouble(); // <--- تم الإصلاح هنا
                                value = (1 - (value * 0.5)).clamp(0.0, 1.0);
                              }

                              return Center(
                                child: Opacity(
                                  opacity: value,
                                  child: Transform.scale(
                                    scale: value,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      child: Image.asset(
                                        logo,
                                        height: logoHeight,
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
      },
    );
  }
}
