import 'package:flutter/material.dart';

class Skelton extends StatelessWidget {
  const Skelton({
    super.key,
    this.height,
    this.width,
  });

  final double? height, width;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.04),
          borderRadius: const BorderRadius.all(Radius.circular(16))),
    );
  }
}

class BookCardSkelton extends StatelessWidget {
  const BookCardSkelton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Skelton(
          height: 125,
          width: 90,
        ),
        SizedBox(
          width: 5,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Skelton(
                width: 180,
                height: 10,
              ),
              SizedBox(height: 8),
              Skelton(
                width: 180,
                height: 10,
              ),
              SizedBox(height: 8),
              Skelton(
                width: 100,
                height: 10,
              ),
              SizedBox(height: 8),
            ],
          ),
        ),
      ],
    );
  }
}

class BookCardSkeltonImage extends StatelessWidget {
  const BookCardSkeltonImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Skelton(
          height: 220,
          width: 160,
        ),
        SizedBox(
          width: 10,
        ),
      ],
    );
  }
}
