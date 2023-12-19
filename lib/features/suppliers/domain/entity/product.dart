import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String id;
  final String name;
  final int quantity;
  final double price;
  final String description;
  final String imageUrl;
  final String category;
  final  DateTime createdAt;

  const Product({
    required this.id,
    required this.name,
    required this.quantity,
    required this.price,
    required this.description,
    required this.imageUrl,
    required this.category,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [ id, quantity, name];

}
