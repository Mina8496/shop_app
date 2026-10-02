import 'package:flutter/material.dart';
import 'package:shop_app/core/utils/styles.dart';

class BuildBoardingItem extends StatelessWidget {
  const BuildBoardingItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Image(image: AssetImage('assets/images/onBoarding.png')),
        ),
        SizedBox(height: 15),
        Text('data', style: Styles.styleSemibold24),
        SizedBox(height: 15),
        Text('screen title', style: Styles.styleBold16),
      ],
    );
  }
}