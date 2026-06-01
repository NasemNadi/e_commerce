import 'package:ecommerce_app/features/products/data/models/product_model.dart';

import '../../../../core/network/api_services.dart';
import 'brand_model.dart';
import 'category_model.dart';

class ProductRepo {
  final ApiServices _apiServices = ApiServices();

  // getAllProducts
  Future<List<ProductModel>> getAllProducts() async {
    try {
      final response = await _apiServices.get(
        '/home/products?skip=0&limit=10&sortBy=price&order=asc',
      );
      final List data = response is Map ? (response['list'] ?? response['data'] ?? []) : response;
      return data.map((e) => ProductModel.fromJson(e)).toList();
    } catch (e) {
      print("Error in getAllProducts: $e");
      rethrow;
    }
  }

  // getProductsByCategory
  Future<List<ProductModel>> getProductsByCategory(String category) async {
    final response = await _apiServices.get(
      '/home/products/category/$category?skip=0&limit=10',
    );
    final List data = response is Map ? (response['list'] ?? response['data'] ?? []) : response;
    return data.map((e) => ProductModel.fromJson(e)).toList();
  }

  // getProductsByBrand
  Future<List<ProductModel>> getProductsByBrand(String brand) async {
    final response = await _apiServices.get(
      '/home/products/brand/$brand?skip=0&limit=10',
    );
    final List data = response is Map ? (response['list'] ?? response['data'] ?? []) : response;
    return data.map((e) => ProductModel.fromJson(e)).toList();
  }

  // getAllCategories
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final response = await _apiServices.get('/home/categories');

      final List data = response is Map
          ? (response['list'] ?? response['data'] ?? response['categories'] ?? [])
          : response;

      return data.map((e) => CategoryModel.fromJson(e)).toList();
    } catch (e) {
      print("Error in getAllCategories: $e");
      rethrow;
    }
  }

  // getAllBrands
  Future<List<BrandModel>> getAllBrands() async {
    try {
      final response = await _apiServices.get('/home/brands');

      final List data = response is Map
          ? (response['list'] ?? response['data'] ?? response['brands'] ?? [])
          : response;

      return data.map((e) => BrandModel.fromJson(e)).toList();
    } catch (e) {
      print("Error in getAllBrands: $e");
      rethrow;
    }
  }
}