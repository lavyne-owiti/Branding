import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String id;
  final String supplierId;
  final String name;
  final double price;
  final String description;
  final String imageUrl;

  const Product({
    required this.id,
    required this.supplierId,
    required this.name,
    required this.price,
    required this.description,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [ id, supplierId, name];
}
