
import 'package:branding/features/suppliers/domain/entity/product.dart';

import '../model/product_model.dart';

extension ProductExtension on ProductModel {
  Product toEntity() => Product(
        id: id,
        category: category,
        description: description,
        imageUrl: imageUrl,
        name: name,
        price: price,
        quantity: quantity,
        createdAt: createdAt,
      );
}

extension ProductModelExtension on Product {
  ProductModel toModel() => ProductModel(
        id: id,
        category: category,
        description: description,
        imageUrl: imageUrl,
        name: name,
        price: price,
        quantity: quantity,
        createdAt: createdAt,
      );
}