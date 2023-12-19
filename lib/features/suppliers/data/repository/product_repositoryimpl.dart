import 'package:branding/features/suppliers/data/datasource/product_remote_datasource.dart';
import 'package:branding/features/suppliers/data/mapper/product_mapper.dart';
import 'package:branding/features/suppliers/domain/entity/product.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/core.dart';
import '../../domain/repository/product_repository.dart';

class ProductRepositoryImpl extends ProductRepository {
  ProductRemoteDatasource productRemoteDatasource;
  ProductRepositoryImpl({required this.productRemoteDatasource});

// @override
//   Future<Either<Failure, Product>> addProducts(Product product) {
//    return handleExceptions<Product>(() async {
//       final productModel =
//           await  productRemoteDatasource.addProduct(product.toModel());
//       return productModel.toEntity();
//     });
//   }


  @override
  Future<Either<Failure, List<Product>>> getProducts() {
    throw UnimplementedError();
  }
  
  @override
  Future<Either<Failure, Product>> addProducts(String name, int quantity,
   double price, String description, String imageUrl, String category) {
     return handleExceptions<Product>(() async {
      final productModel =
          await productRemoteDatasource.addProduct(name, quantity, price, description, imageUrl, category);
      return productModel.toEntity();
    });
  }
  
}

final productRepositoryProvider = Provider.autoDispose<ProductRepository>((ref) {
  return ProductRepositoryImpl(
    productRemoteDatasource: ref.watch(productRemoteDatasourceProvider),
  );
});