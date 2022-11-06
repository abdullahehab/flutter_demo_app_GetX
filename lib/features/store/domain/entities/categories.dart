import 'package:equatable/equatable.dart';

class Categories extends Equatable {
  final int id;
  final String name;
  final String color;

  const Categories({required this.id, required this.name, required this.color});

  @override
  List<Object> get props => [id, name, color];
}
