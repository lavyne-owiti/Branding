import 'package:branding/core/core.dart';
import 'package:branding/features/suppliers/domain/entity/product.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repository/product_repositoryImpl.dart';
import '../repository/product_repository.dart';

class AddProductUseCase extends UseCase<void, AddProductParams> {
  ProductRepository repository;

  AddProductUseCase({
    required this.repository,
  });

  @override
  Future<Either<Failure, Product>> call(params) {
    return repository.addProducts(
      params.name,
      params.quantity,
      params.price,
      params.description,
      params.imageUrl,
      params.category,);
  }
}

class AddProductParams {
   final String name;
  final int quantity;
  final double price;
  final String description;
  final String imageUrl;
  final String category;

  AddProductParams({
    required this.name,
    required this.quantity, 
    required this.price,
    required this.description,
    required this.imageUrl,
    required this.category,
    
  });
}

final addProductUseCaseProvider = Provider.autoDispose<AddProductUseCase>((ref) {
  return AddProductUseCase(
    repository: ref.watch(productRepositoryProvider),
  );
});