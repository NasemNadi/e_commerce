import 'package:ecommerce_app/features/products/data/models/product_model.dart';

import '../../data/models/brand_model.dart';
import '../../data/models/category_model.dart';

abstract class ProductsState {}

class ProductsInitial extends ProductsState {}

class ProductsLoading extends ProductsState {}

class ProductsSuccess extends ProductsState {
  final List<ProductModel> products;
  ProductsSuccess(this.products);
}

class ProductsError extends ProductsState {
  final String message;
  ProductsError(this.message);
}

class HomeDataSuccess extends ProductsState {
  final List<ProductModel>  products;
  final List<CategoryModel> categories;
  final List<BrandModel>    brands;
  HomeDataSuccess({
    required this.products,
    required this.categories,
    required this.brands,
  });
}