import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_app/core/widgets/appbar.dart';
import 'package:ecommerce_app/features/products/data/models/product_model.dart';
import 'package:ecommerce_app/features/products/presentation/views/widgets/home_search_bar.dart';
import 'package:ecommerce_app/features/products/presentation/views/widgets/product_card.dart';

import '../../cubits/FavoritesCubit.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: App_bar(titel: 'Favorites'),
      body: BlocBuilder<FavoritesCubit, List<ProductModel>>(
        builder: (context, favorites) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16, vertical: 12),
                child: HomeSearchBar(
                  onChanged: (value) {
                    print("المستخدم بيكتب دلوقتي: $value");
                  },

                ),
              ),

              // ── All Products Label ────────────────
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'All Products (${favorites.length})',
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // ── Products Grid ─────────────────────
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: favorites.isEmpty
                      ? const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.favorite_outline,
                            size: 64, color: Colors.grey),
                        SizedBox(height: 12),
                        Text(
                          'No favorites yet',
                          style: TextStyle(
                              fontSize: 16, color: Colors.grey),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Tap the heart icon on any product',
                          style: TextStyle(
                              fontSize: 13, color: Colors.grey),
                        ),
                      ],
                    ),
                  )
                      : GridView.builder(
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 0.65,
                    ),
                    itemCount: favorites.length,
                    itemBuilder: (_, i) => ProductCard(
                      product: favorites[i],
                      onTap: () {},
                      showAddButton: true,
                      showDiscount:
                      favorites[i].discountPercentage > 0,
                      isFavorite: true,
                      onFavoriteTap: () {
                        context
                            .read<FavoritesCubit>()
                            .toggleFavorite(favorites[i]);
                      },
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}