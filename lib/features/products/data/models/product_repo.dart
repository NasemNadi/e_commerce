import 'package:ecommerce_app/features/products/data/models/product_model.dart';

import '../../../../core/network/api_services.dart';
import 'brand_model.dart';
import 'category_model.dart';

class ProductRepo {
  final ApiServices _apiServices = ApiServices();

  // 1️⃣ جيب كل المنتجات
  Future<List<ProductModel>> getAllProducts() async {
    try {
      final response = await _apiServices.get(
        '/home/products?skip=0&limit=10&sortBy=price&order=asc',
      );
      // تأمين لو الـ response راجع بأي شكل
      final List data = response is Map ? (response['list'] ?? response['data'] ?? []) : response;
      return data.map((e) => ProductModel.fromJson(e)).toList();
    } catch (e) {
      print("Error in getAllProducts: $e");
      rethrow;
    }
  }

  // 2️⃣ جيب منتجات category معينة
  Future<List<ProductModel>> getProductsByCategory(String category) async {
    final response = await _apiServices.get(
      '/home/products/category/$category?skip=0&limit=10',
    );
    final List data = response is Map ? (response['list'] ?? response['data'] ?? []) : response;
    return data.map((e) => ProductModel.fromJson(e)).toList();
  }

  // 3️⃣ جيب منتجات brand معينة
  Future<List<ProductModel>> getProductsByBrand(String brand) async {
    final response = await _apiServices.get(
      '/home/products/brand/$brand?skip=0&limit=10',
    );
    final List data = response is Map ? (response['list'] ?? response['data'] ?? []) : response;
    return data.map((e) => ProductModel.fromJson(e)).toList();
  }

  // 4️⃣ جيب كل الـ Categories (هنا المشكلة غالبا)
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final response = await _apiServices.get('/home/categories');

      // لو الـ API بيرجع اللستة مباشرة [{}, {}] أو جوه مفتاح معين
      final List data = response is Map
          ? (response['list'] ?? response['data'] ?? response['categories'] ?? [])
          : response;

      return data.map((e) => CategoryModel.fromJson(e)).toList();
    } catch (e) {
      print("Error in getAllCategories: $e");
      rethrow;
    }
  }

  // 5️⃣ جيب كل الـ Brands
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