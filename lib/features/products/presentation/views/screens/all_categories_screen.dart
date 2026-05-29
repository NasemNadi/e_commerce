import 'package:ecommerce_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/core/widgets/appbar.dart';

import '../widgets/category_card.dart';
import '../widgets/home_search_bar.dart';

class AllCategoriesScreen extends StatelessWidget {
  const AllCategoriesScreen({super.key});

  static const List<String> _categories = [
    'Electronics', 'Pampers', 'Furniture',
    'Phones', 'Food', 'Fashion',
    'Plants', 'Gaming',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:App_bar(titel:'Categories'),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: HomeSearchBar(onTap: () {}),
          ),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('All Categories',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,color: AppColors.blacktext)),
            ),
          ),

          const SizedBox(height: 12),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1.1,
                ),
                itemCount: _categories.length,
                itemBuilder: (_, i) => CategoryCard(
                  name: _categories[i],
                  image: '',
                  onTap: () {
                    // TODO: Navigate to Category Products
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}