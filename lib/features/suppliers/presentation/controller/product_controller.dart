// class AuthController extends StateNotifier<AuthState> {

// import 'package:branding/features/suppliers/domain/entity/product.dart';
import 'package:branding/features/suppliers/domain/usecases/add_product_usecase.dart';
import 'package:branding/features/suppliers/presentation/state/product_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductController extends StateNotifier<ProductState> {
  AddProductUseCase addProductUseCase;
  ProductController(
    {
      required this.addProductUseCase,
    }) : super(ProductInitial());

Future<void> addProduct({
   required String name,
  required int quantity,
  required double price,
  required String description,
  required String imageUrl,
  required String category,
}) async {
    state = ProductSaving();

    final result = await addProductUseCase(AddProductParams(
      name: name,
      quantity: quantity,
      price: price,
      description: description,
      imageUrl: imageUrl,
      category: category,));
    result.fold(
      ( failure) {
        state = ProductError(failure);
      },
      (success)async {
        state = ProductAdded();
      },
    );
  }
}


final productControllerProvider = StateNotifierProvider.autoDispose<ProductController, ProductState>(
  (ref) {
    return ProductController(
      addProductUseCase: ref.watch(addProductUseCaseProvider),
    );
  },
);