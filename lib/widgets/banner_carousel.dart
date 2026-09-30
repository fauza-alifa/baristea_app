import 'dart:async';

import 'package:baristea_app/models/promo_banner.dart';
import 'package:baristea_app/theme/app_theme.dart';
import 'package:baristea_app/widgets/banner_slide.dart';
import 'package:baristea_app/widgets/carousel_dots.dart';
import 'package:flutter/material.dart';

class BannerCarousel extends StatefulWidget {
  const BannerCarousel({super.key, required this.banners});

  final List<PromoBanner> banners;

  @override
  State<BannerCarousel> createState() => _BannerCarouselState();
}

class _BannerCarouselState extends State<BannerCarousel> {
  late final PageController _controller;
  Timer? _timer;
  int _page = 0;

  @override
  void initState() {
    super.initState();

    _controller = PageController(viewportFraction: 0.9);

    _timer = Timer.periodic(Duration(seconds: 4), (_) {
      if (!mounted || widget.banners.isEmpty) return;

      final next = (_page + 1) % widget.banners.length;

      _controller.animateToPage(
        next,
        duration: Duration(milliseconds: 650),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.banners.isEmpty) {
      return SizedBox.shrink();
    }

    return Column(
      children: [
        SizedBox(
          height: 240,
          child: PageView.builder(
            controller: _controller,
            itemCount: widget.banners.length,
            onPageChanged: (index) {
              setState(() {
                _page = index;
              });
            },
            itemBuilder: (context, index) {
              final isActive = index == _page;

              return AnimatedScale(
                scale: isActive ? 1.0 : 0.94,
                duration: Duration(milliseconds: 300),
                curve: Curves.easeOut,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: AppTheme.primary, width: 4)
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(28),
                      child: BannerSlide(banner: widget.banners[index]),
                    ),
                  ),
                ),
              );
            },
          ),
        ),

        SizedBox(height: 8),

        CarouselDots(
          count: widget.banners.length,
          activeIndex: _page,
          activeColor: widget.banners[_page].gradientColors.first,
        ),
      ],
    );
  }
}
