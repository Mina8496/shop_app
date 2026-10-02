import 'package:flutter/material.dart';
import 'package:shop_app/feature/on_boarding/presentation/page/widget/build_boarding_item.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                itemBuilder: (context, index) => BuildBoardingItem(),
                itemCount: 3,
              ),
            ),
            SizedBox(height: 40),
            Row(
              children: [
                Text('indctor'),
                Spacer(),
                FloatingActionButton(
                  onPressed: () {},
                  child: Icon(Icons.arrow_forward_ios),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
