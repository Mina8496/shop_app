import 'package:equatable/equatable.dart';

class BoardingEntity extends Equatable {
  final String image;
  final String title;
  final String body;

  const BoardingEntity({
    required this.image,
    required this.title,
    required this.body,
  });

  @override
  List<Object?> get props => [image, title, body];
}
