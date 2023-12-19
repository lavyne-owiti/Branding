
import '../../../../core/core.dart';

class  ProductState {}

class ProductInitial extends ProductState {}

class ProductAdded extends ProductState {}

class ProductUpdated extends ProductState {}

class ProductSaving extends ProductState {}

class ProductLoading extends ProductState {}

class ProductError extends ProductState {
  final Failure failure;
  ProductError(this.failure);
}