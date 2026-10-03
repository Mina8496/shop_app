class BoardingItem {
  final String image;
  final String title;
  final String body;

  const BoardingItem({
    required this.image,
    required this.title,
    required this.body,
  });
}

const boardingItems = [
  BoardingItem(
    image: 'assets/images/onBoarding.png',
    title: 'on Boarding title 1',
    body: 'on Boarding 1 body',
  ),
  BoardingItem(
    image: 'assets/images/onBoarding.png',
    title: 'on Boarding title 2',
    body: 'on Boarding 2 body',
  ),
  BoardingItem(
    image: 'assets/images/onBoarding.png',
    title: 'on Boarding title 3',
    body: 'on Boarding 3 body',
  ),
];
