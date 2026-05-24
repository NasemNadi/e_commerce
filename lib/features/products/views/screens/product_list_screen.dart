import 'package:flutter/material.dart';
import 'package:ecommerce_app/core/utils/app_colors.dart';
import 'package:ecommerce_app/core/widgets/appbar.dart';
import 'package:ecommerce_app/features/products/models/product_model.dart';
import 'package:ecommerce_app/features/products/views/widgets/product_card.dart';
import 'package:ecommerce_app/features/products/views/widgets/home_search_bar.dart';

class ProductListScreen extends StatelessWidget {
  final String title;

  const ProductListScreen({super.key, required this.title});

  // ── Dummy Data (هيتستبدل بالـ API بعدين) ──
  static final List<ProductModel> _products = [
    ProductModel(id: 1, name: 'Black JBL Airpods',     price: 799,   image: '', description: ''),
    ProductModel(id: 2, name: 'Sony Smart TV 55 inch', price: 13999, image: '', description: ''),
    ProductModel(id: 3, name: 'Smart Watch',           price: 499,   image: '', description: ''),
    ProductModel(id: 4, name: 'Women\'s Ankle boots',  price: 499,   image: '', description: ''),
    ProductModel(id: 5, name: 'Black Sony Headphone',  price: 399,   image: '', description: ''),
    ProductModel(id: 6, name: 'HP Chromebook laptop',  price: 14999, image: '', description: ''),
    ProductModel(id: 7, name: 'Pampers Swaddlers',     price: 345,   image: '', description: ''),
    ProductModel(id: 8, name: 'Seventh Generation',    price: 88,    image: '', description: ''),
    ProductModel(id: 9, name: 'iPhone 11 Pro',         price: 19999, image: '', description: ''),
    ProductModel(id: 10, name: 'Canon 5D Camera',      price: 4999,  image: '', description: ''),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: App_bar(titel: title),
      body: Column(
        children: [

          // ── Search Bar ────────────────────────
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: HomeSearchBar(onTap: () {}),
          ),

          // ── All Products Label ────────────────
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'All Products',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
          ),

          const SizedBox(height: 12),

          // ── Products Grid ─────────────────────
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.72,
                ),
                itemCount: _products.length,
                itemBuilder: (_, i) => ProductCard(
                  product: _products[i],
                  onTap: () {
                    // TODO: Navigate to Product Detail
                  },
                  showAddButton: true,
                  showDiscount: i % 2 == 0, // بيعرض discount على المنتجات الزوجية
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}