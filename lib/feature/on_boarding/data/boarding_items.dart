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
    title: 'Title 1',
    body: 'Body 1',
  ),
  BoardingItem(
    image: 'assets/images/onBoarding.png',
    title: 'Title 2',
    body: 'Body 2',
  ),
  BoardingItem(
    image: 'assets/images/onBoarding.png',
    title: 'Title 3',
    body: 'Body 3',
  ),
];
