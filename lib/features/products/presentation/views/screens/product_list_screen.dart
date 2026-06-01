import 'package:ecommerce_app/features/products/presentation/views/screens/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_app/core/widgets/appbar.dart';
import 'package:ecommerce_app/features/products/presentation/cubits/products_state.dart';
import '../../../data/models/product_model.dart';
import '../../cubits/product_cubit.dart';
import '../widgets/home_search_bar.dart';
import '../widgets/product_card.dart';

class ProductListScreen extends StatelessWidget {
  final String title;
  final List<ProductModel>? products;

  const ProductListScreen({super.key, required this.title, this.products});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: App_bar(titel: title),
        body: Column(
          children: [
            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child:  HomeSearchBar(
                onChanged: (value) {
                  print("المستخدم بيكتب دلوقتي: $value");
                },

              ),
            ),

            // Label
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('All Products',
                    style: TextStyle(fontSize: 15,
                        fontWeight: FontWeight.bold, color: Colors.black87)),
              ),
            ),

            const SizedBox(height: 12),

            // Grid
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: products != null
                    ? _buildGrid(products!)
                    : BlocBuilder<ProductsCubit, ProductsState>(
                  builder: (context, state) {
                    if (state is ProductsLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is ProductsError) {
                      return Center(child: Text(state.message, style: const TextStyle(color: Colors.red)));
                    } else if (state is ProductsSuccess) {
                      return _buildGrid(state.products);
                    } else if (state is HomeDataSuccess) {
                      return _buildGrid(state.products);
                    }
                    return const SizedBox();
                  },
                ),
              ),
            ),
          ],
        )
    );
  }

  Widget _buildGrid(List<ProductModel> list) {
    if (list.isEmpty) {
      return const Center(child: Text('No Products Found', style: TextStyle(color: Colors.grey)));
    }
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.72,
      ),
      itemCount: list.length,
      itemBuilder: (context, i) => ProductCard(
        product: list[i],
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ProductDetailScreen(product: list[i]),
            ),
          );
        },
      ),
    );
  }
}