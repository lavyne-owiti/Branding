import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/core.dart';
import '../model/product_model.dart';

abstract class ProductRemoteDatasource {
  Future<List<ProductModel>> getProducts();
  Future<ProductModel> addProduct(String name, int quantity,
      double price, String description, String imageUrl, String category);
}

class ProductRemoteDatasourceImpl extends ProductRemoteDatasource {
  NetworkInfo networkInfo;

  ProductRemoteDatasourceImpl({required this.networkInfo});

   @override
  Future<ProductModel> addProduct(String name, int quantity, double price,
   String description, String imageUrl, String category) {
    return handleErrors<ProductModel>(() async {
      if (!await networkInfo.isConnected) throw NetworkException();

      // Upload image to Firebase Storage
      File imageFile = File(imageUrl);
      var storageRef = FirebaseStorage.instance
          .ref()
          .child('product_images')
          .child('${name}_${DateTime.now().millisecondsSinceEpoch}.png');
      await storageRef.putFile(imageFile);
      // // Get download URL for the uploaded image

      String uploadedImageUrl = await storageRef.getDownloadURL();
      
      // Add product details to Firestore
      var products =
          await FirebaseFirestore.instance.collection('products').add({
        'id': 0,
        'category': category,
        'description': description,
        'imageUrl': imageUrl,
        'name':name,
        'price': price,
        'quantity':quantity,
        'createdAt':DateTime.now(),
      });

       return ProductModel(
        id: products.id,
        category:category,
        description: description,
        imageUrl: imageUrl,
        name: name,
        price: price,
        quantity:quantity,
        createdAt: DateTime.now(),
      );   
    });
  }


  @override
  Future<List<ProductModel>> getProducts() {
    throw UnimplementedError();
  }
  
 
}

final productRemoteDatasourceProvider =
    Provider.autoDispose<ProductRemoteDatasource>((ref) {
  return ProductRemoteDatasourceImpl(
    networkInfo: ref.watch(networkInfoProvider),
  );
});