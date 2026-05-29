import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/product_model.dart';
import '../../data/models/product_repo.dart';
import 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final ProductRepo _repo = ProductRepo();

  ProductsCubit() : super(ProductsInitial());

  //AllProducts  ───────────────────────
  Future<void> fetchAllProducts() async {
    emit(ProductsLoading());
    try {
      final products = await _repo.getAllProducts();
      emit(ProductsSuccess(products));
    } catch (e) {
      emit(ProductsError(e.toString()));
    }
  }

  // category ───────────────────
  Future<void> fetchByCategory(String category) async {
    emit(ProductsLoading());
    try {
      final products = await _repo.getProductsByCategory(category);
      emit(ProductsSuccess(products));
    } catch (e) {
      emit(ProductsError(e.toString()));
    }
  }

  //  brand ──────────────────────
  Future<void> fetchByBrand(String brand) async {
    emit(ProductsLoading());
    try {
      final products = await _repo.getProductsByBrand(brand);
      emit(ProductsSuccess(products));
    } catch (e) {
      emit(ProductsError(e.toString()));
    }
  }

  //  ────────
  Future<void> fetchHomeData() async {
    emit(ProductsLoading());
    try {
      final products   = await _repo.getAllProducts();
      final categories = await _repo.getAllCategories();
      final brands     = await _repo.getAllBrands();
      emit(HomeDataSuccess(
        products:   products,
        categories: categories,
        brands:     brands,
      ));
    } catch (e) {
      emit(ProductsError(e.toString()));
    }
  }
}