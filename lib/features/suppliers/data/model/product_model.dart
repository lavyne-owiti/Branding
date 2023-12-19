import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class ProductModel extends Equatable {
  final String id;

  final String name;
  final int quantity;
  final double price;
  final String description;
  final String imageUrl;
  final String category;
  final  DateTime createdAt;

  const ProductModel({
    required this.id,
    required this.name,
    required this.quantity,
    required this.price,
    required this.description,
    required this.imageUrl,
    required this.category,
    required this.createdAt
  });

  @override
  List<Object?> get props => [ id, quantity, name];

   factory ProductModel.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return ProductModel(
      id: data['id'],//doc.get("id"),
      category: data['category'],
      description: data['description'],
      imageUrl: data['imageUrl'],
      name: data['name'], 
      price: data['price'],
      quantity: data['quantity'],
      createdAt: data['createdAt'].toDate(),  
    );
  }
}
