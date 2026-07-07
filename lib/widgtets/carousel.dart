import 'package:flutter/material.dart';

// 1. O Carousel agora é um StatefulWidget independente
class Carousel extends StatefulWidget {
  const Carousel({super.key});

  @override
  State<Carousel> createState() => _CarouselState();
}

// 2. Aqui fica o Estado (lógica e design) exclusivo do Carousel
class _CarouselState extends State<Carousel> {
  late PageController _pageController;
  final int _quantidadeDeCards = 5;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.65, initialPage: 1000);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400.0,
      child: PageView.builder(
        controller: _pageController,
        itemBuilder: (context, index) {
          int realIndex = index % _quantidadeDeCards;

          return AnimatedBuilder(
            animation: _pageController,
            builder: (context, child) {
              double pageOffset = 0;

              if (_pageController.position.haveDimensions) {
                pageOffset = _pageController.page! - index;
              } else {
                pageOffset = (1000.0 - index);
              }

              double scale = (1 - (pageOffset.abs() * 0.35)).clamp(0.0, 1.0);
              double translateY = (1 - scale) * -150;

              double translateX = pageOffset * 30;

              return Transform.translate(
                offset: Offset(translateX, translateY),
                child: Transform.scale(scale: scale, child: child),
              );
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 0.80),
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Center(
                child: Text(
                  'text ${realIndex + 1}',
                  style: const TextStyle(fontSize: 16.0),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
