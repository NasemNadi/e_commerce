import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/product_model.dart';

class FavoritesCubit extends Cubit<List<ProductModel>> {
  FavoritesCubit() : super([]);

  void toggleFavorite(ProductModel product) {
    final current = List<ProductModel>.from(state);
    final exists = current.any((p) => p.id == product.id);
    if (exists) {
      current.removeWhere((p) => p.id == product.id);
    } else {
      current.add(product);
    }
    emit(current);
  }

  bool isFavorite(int productId) {
    return state.any((p) => p.id == productId);
  }
}