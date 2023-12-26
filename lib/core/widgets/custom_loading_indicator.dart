import 'package:flutter/material.dart';

class CustomLoadingIndincator extends StatelessWidget {
  const CustomLoadingIndincator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
