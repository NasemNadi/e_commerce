import 'package:ecommerce_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/core/widgets/appbar.dart';

import '../widgets/category_card.dart';
import '../widgets/home_search_bar.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  static const List<String> _brands = [
    'TOWN TEAM', 'JBL', 'Pampers',
    'Canon', 'Apple', 'adidas',
    'LACOSTE', 'TOSHIBA',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:AppColors.scaffoldBackground,
        appBar: App_bar(titel: 'Brands'),
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
              child: Text('All Brands',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: AppColors.blacktext)),
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
                itemCount: _brands.length,
                itemBuilder: (_, i) => CategoryCard(
                  name: _brands[i],
                  image: '',
                  onTap: () {
                    // TODO: Navigate to Brand Products
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