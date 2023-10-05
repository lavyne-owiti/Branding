import 'package:branding/features/auth/auth.dart';
import 'package:branding/features/cart/cart.dart';
import 'package:branding/features/home/home.dart';
import 'package:branding/features/suppliers/suppliers.dart';

import '../core/shared/feature.dart';
import 'product/product.dart';

List<Feature> features = [
  AuthFeature(),
  HomeFeature(),
  ProductFeature(),
  CartFeature(),
  SuppliersFeature()

];
