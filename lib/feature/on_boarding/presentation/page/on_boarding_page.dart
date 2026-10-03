import 'package:flutter/material.dart';
import 'package:shop_app/core/utils/color_palette.dart';
import 'package:shop_app/feature/on_boarding/data/boarding_items.dart';
import 'package:shop_app/feature/on_boarding/presentation/page/widget/build_boarding_item.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final _controller = PageController();
  int _currentIndex = 0;

  bool get _isLast => _currentIndex == boardingItems.length - 1;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
                physics: BouncingScrollPhysics(),
                controller: _controller,
                itemCount: boardingItems.length,
                onPageChanged: (i) => setState(() => _currentIndex = i),
                itemBuilder: (context, index) =>
                    BuildBoardingItem(item: boardingItems[index]),
              ),
            ),
            SizedBox(height: 30),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: _controller,
                  count: boardingItems.length,
                  effect: ExpandingDotsEffect(
                    dotColor: ColorPalette.kBlackColor,
                    activeDotColor: ColorPalette.kLightRed,
                    dotHeight: 10,
                    dotWidth: 10,
                    expansionFactor: 4,
                    spacing: 5,
                  ),
                ),
                Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    _controller.nextPage(
                      duration: Duration(milliseconds: 750),
                      curve: Curves.fastLinearToSlowEaseIn,
                    );
                  },
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
