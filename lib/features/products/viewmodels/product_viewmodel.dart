// features/products/viewmodels/product_viewmodel.dart

import 'package:flutter/material.dart';
import '../models/product_model.dart';

class ProductViewModel extends ChangeNotifier {

  // ── State ─────────────────────────────────
  List<ProductModel> _popularProducts = [];
  List<ProductModel> _bestForYou      = [];
  List<ProductModel> _buyAgain        = [];
  bool    _isLoading = false;
  String? _error;

  // ── Getters ───────────────────────────────
  List<ProductModel> get popularProducts => _popularProducts;
  List<ProductModel> get bestForYou      => _bestForYou;
  List<ProductModel> get buyAgain        => _buyAgain;
  bool               get isLoading       => _isLoading;
  String?            get error           => _error;

  // ── Dummy Data (هيتستبدل بالـ API بعدين) ──
  Future<void> fetchHomeData() async {
    _isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(milliseconds: 500));

    _popularProducts = [
      ProductModel(id: 1, name: 'Smart Watch',      price: 499,   image: 'https://via.placeholder.com/150', description: ''),
      ProductModel(id: 2, name: 'iPhone 11 Pro',    price: 19999, image: 'https://via.placeholder.com/150', description: ''),
      ProductModel(id: 3, name: 'Black JBL Airpods',price: 799,   image: 'https://via.placeholder.com/150', description: ''),
      ProductModel(id: 4, name: 'Sony Smart TV 55', price: 13999, image: 'https://via.placeholder.com/150', description: ''),
    ];

    _bestForYou = _popularProducts;
    _buyAgain   = _popularProducts;

    _isLoading = false;
    notifyListeners();
  }
}