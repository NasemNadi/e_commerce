import 'package:ecommerce_app/core/utils/app_assets.dart';
import 'package:ecommerce_app/features/products/views/screens/all_brands_screen.dart';
import 'package:ecommerce_app/features/products/views/screens/all_categories_screen.dart';
import 'package:ecommerce_app/features/products/views/screens/product_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/core/utils/app_colors.dart';
import 'package:ecommerce_app/features/products/models/product_model.dart';
import 'package:ecommerce_app/features/products/views/widgets/home_header.dart';
import 'package:ecommerce_app/features/products/views/widgets/home_search_bar.dart';
import 'package:ecommerce_app/features/products/views/widgets/home_banner.dart';
import 'package:ecommerce_app/features/products/views/widgets/section_header.dart';
import 'package:ecommerce_app/features/products/views/widgets/product_card.dart';
import 'package:ecommerce_app/features/products/views/widgets/category_card.dart';
import 'package:ecommerce_app/features/products/views/widgets/brand_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // ── Dummy Data (هيتستبدل بالـ API بعدين) ──
  static final List<ProductModel> _popularProducts = [
    ProductModel(
      id: 1,
      name: 'Smart Watch',
      price: 499,
      image: 'https://via.placeholder.com/150',
      description: '',
    ),
    ProductModel(
      id: 2,
      name: 'iPhone 11 Pro',
      price: 19999,
      image: 'https://via.placeholder.com/150',
      description: '',
    ),
    ProductModel(
      id: 3,
      name: 'Black JBL Airpods',
      price: 799,
      image: 'https://via.placeholder.com/150',
      description: '',
    ),
    ProductModel(
      id: 4,
      name: 'Sony Smart TV 55',
      price: 13999,
      image: 'https://via.placeholder.com/150',
      description: '',
    ),
  ];

  static final List<Map<String, String>> _categories = [
    {'name': 'Pampers',     'image': 'https://via.placeholder.com/70'},
    {'name': 'Electronics', 'image': 'https://via.placeholder.com/70'},
    {'name': 'Plants',      'image': 'https://via.placeholder.com/70'},
    {'name': 'Phones',      'image': 'https://via.placeholder.com/70'},
    {'name': 'Food',        'image': 'https://via.placeholder.com/70'},
    {'name': 'Fashion',     'image': 'https://via.placeholder.com/70'},
  ];

  static final List<String> _brands = [
    'https://via.placeholder.com/100x60?text=TownTeam',
    'https://via.placeholder.com/100x60?text=JBL',
    'https://via.placeholder.com/100x60?text=Sony',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const SizedBox(height: 16),

              // ① Header
              const HomeHeader(userName: 'Yousef'),

              const SizedBox(height: 16),

              // ② Search Bar
              HomeSearchBar(onTap: () {
                // TODO: Navigate to Search
              }),

              const SizedBox(height: 16),

              // ③ Banner
              const HomeBanner(),

              const SizedBox(height: 20),

              // ④ Popular Products
              SectionHeader(
                title: 'Popular Product',
                onViewAll: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ProductListScreen(title: 'Popular Product'),
                    ),
                  );
                },
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 180,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: _popularProducts.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 12),
                  itemBuilder: (_, i) => SizedBox(
                    width: 130,
                    child: ProductCard(showDiscount: true,
                      product: _popularProducts[i],
                      onTap: () {
                        // TODO: Navigate to Product Detail
                      },
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // ⑤ Categories
              SectionHeader(
                title: 'Category',
                onViewAll: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const AllCategoriesScreen()));

                },
              ),
              const SizedBox(height: 12),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.9,
                ),
                itemCount: _categories.length,
                itemBuilder: (_, i) => CategoryCard(
                  name:  _categories[i]['name']!,
                  image: _categories[i]['image']!,
                  onTap: () {
                    // TODO: Navigate to Category
                  },
                ),
              ),

              const SizedBox(height: 20),

              // ⑥ Best for You
              SectionHeader(
                title: 'Best for You',
                onViewAll: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ProductListScreen(title: 'Best four you '),
                    ),
                  );
                },
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 260,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: _popularProducts.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 12),
                  itemBuilder: (_, i) => SizedBox(
                    width: 160,
                    child: _BestForYouCard(product: _popularProducts[i]),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // ⑦ Brands
              SectionHeader(
                title: 'Brands',
                onViewAll: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const AllBrandsScreen()));
                },
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 70,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: _brands.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 12),
                  itemBuilder: (_, i) => BrandCard(
                    image: _brands[i],
                    onTap: () {
                      // TODO: Navigate to Brand
                    },
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // ⑧ Buy Again
              SectionHeader(
                title: 'Buy Again',
                onViewAll: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ProductListScreen(title: 'Buy Again'),
                    ),
                  );
                },
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 180,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: _popularProducts.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 12),
                  itemBuilder: (_, i) => SizedBox(
                    width: 130,
                    child: ProductCard(showAddButton: true,showDiscount: true,
                      product: _popularProducts[i],
                      onTap: () {},
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),

      // ── Bottom Navigation Bar ──────────────────
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: Colors.grey,
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            activeIcon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            activeIcon: Icon(Icons.favorite),
            label: 'Favorites',

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Menu',
          ),
        ],
      ),
    );
  }
}

// ── Best for You Card ─────────────────────────────────
class _BestForYouCard extends StatelessWidget {
  final ProductModel product;

  const _BestForYouCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // صورة المنتج
          Expanded(
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.asset(
                AppAssets.air_buds,
                fit: BoxFit.cover,
                width: double.infinity,
                errorBuilder: (_, __, ___) => Container(
                  color: Colors.grey.shade100,
                  child: const Icon(Icons.image_not_supported,
                      color: Colors.grey),
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w600,color: AppColors.blacktext),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  '${product.price} LE',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor,
                  ),
                ),
                const SizedBox(height: 6),
                // Add Button
                SizedBox(
                  width: double.infinity,
                  height: 30,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.zero,
                    ),
                    child: const Text(
                      'Add',
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}