import 'package:flutter/material.dart';
import 'package:shop_app/core/utils/styles.dart';
import 'package:shop_app/feature/on_boarding/data/boarding_items.dart';

class BuildBoardingItem extends StatelessWidget {
  final BoardingItem item;
  const BuildBoardingItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: Image.asset(item.image)),
        SizedBox(height: 15),
        Text(item.title, style: Styles.styleSemibold24),
        SizedBox(height: 15),
        Text(item.body, style: Styles.styleBold16),
        SizedBox(height: 15),
      ],
    );
  }
}
