import 'package:ecommerce_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/core/widgets/appbar.dart';
import '../../../data/models/category_model.dart';
import '../widgets/category_card.dart';
import '../widgets/home_search_bar.dart';

class AllCategoriesScreen extends StatelessWidget {
  final List<CategoryModel> categories;

  const AllCategoriesScreen({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: App_bar(titel: 'Categories'),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: HomeSearchBar(
              onChanged: (value) {
                print("المستخدم بيكتب دلوقتي: $value");
              },

            ),
          ),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'All Categories',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: AppColors.blacktext),
              ),
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
                itemCount: categories.length,
                itemBuilder: (_, i) => CategoryCard(
                  name: categories[i].name,
                  image: categories[i].image,
                  onTap: () {
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