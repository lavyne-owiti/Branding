// import 'package:branding/features/product/domain/entity/product.dart';
// import 'package:dartz/dartz.dart';

// import '../../../../core/core.dart';

import 'package:branding/core/core.dart';
import 'package:dartz/dartz.dart';

import '../entity/product.dart';

abstract class ProductRepository {
  Future<Either<Failure, Product>> addProducts(String name, int quantity,
      double price, String description, String imageUrl, String category);
  Future<Either<Failure, List<Product>>> getProducts();
}
