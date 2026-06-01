import 'package:ecommerce_app/features/products/presentation/views/screens/all_categories_screen.dart';
import 'package:ecommerce_app/features/products/presentation/views/screens/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_app/core/utils/app_colors.dart';
import 'package:ecommerce_app/features/products/presentation/cubits/products_state.dart';
import '../../../data/models/product_model.dart';
import '../../cubits/product_cubit.dart';
import '../widgets/brand_card.dart';
import '../widgets/category_card.dart';
import '../widgets/home_banner.dart' hide BrandCard;
import '../widgets/home_header.dart';
import '../widgets/home_search_bar.dart';
import '../widgets/product_card.dart';
import '../widgets/section_header.dart';
import 'all_brands_screen.dart';
import 'cart_screen.dart';
import 'favorites_screen.dart';
import 'product_list_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    context.read<ProductsCubit>().fetchHomeData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _currentIndex == 0 ? _buildHome() : _buildOtherTab(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
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

  Widget _buildHome() {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        return SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),

                const HomeHeader(userName: 'Yousef'),
                const SizedBox(height: 16),

                HomeSearchBar( onChanged: (value) {
                  print("المستخدم بيكتب دلوقتي: $value");
                },),
                const SizedBox(height: 16),

                const HomeBanner(),
                const SizedBox(height: 20),

                SectionHeader(
                  title: 'Popular Product',
                  onViewAll: () {
                    final List<
                        ProductModel> productsList = state is HomeDataSuccess ?
                    (state as HomeDataSuccess).products : [];

                    Navigator.push(context, MaterialPageRoute(
                      builder: (_) =>
                          ProductListScreen(
                            title: 'Popular Product',
                            products: productsList,
                          ),
                    ));
                  },
                ),
                const SizedBox(height: 12),

                if (state is ProductsLoading)
                  const SizedBox(
                    height: 180,
                    child: Center(child: CircularProgressIndicator()),
                  )
                else
                  if (state is ProductsError)
                    SizedBox(
                      height: 180,
                      child: Center(child: Text(state.message,
                          style: const TextStyle(color: Colors.red))),
                    )
                  else
                    if (state is HomeDataSuccess)
                      SizedBox(
                        height: 180,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.products
                              .take(6)
                              .length,
                          separatorBuilder: (_, __) =>
                          const SizedBox(width: 12),
                          itemBuilder: (_, i) =>
                              SizedBox(
                                width: 130,
                                child:
                                ProductCard(
                                    product: state.products[i],
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(
                                        builder: (_) => ProductDetailScreen(product: state.products[i]),
                                      ));
                                    },

                                ),
                              ),
                        ),
                      ),

                const SizedBox(height: 20),

                if (state is HomeDataSuccess) ...[
                  SectionHeader(
                    title: 'Categories',
                    onViewAll: () =>
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                AllCategoriesScreen(
                                categories: state
                                    .categories),
                          ),
                        ),
                  ),
                  const SizedBox(height: 12),

                  if (state is ProductsLoading)
                    const SizedBox(height: 100,
                        child: Center(child: CircularProgressIndicator()))
                  else
                    if (state is ProductsError)
                      Center(child: Text('خطأ في تحميل الأقسام: $state.',
                          style: const TextStyle(color: Colors.red)))
                    else
                      if (state is HomeDataSuccess)
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                            childAspectRatio: 0.9,
                          ),
                          itemCount: state.categories.length,
                          itemBuilder: (_, i) =>
                              CategoryCard(
                                name: state.categories[i].name,
                                image: state.categories[i].image.isNotEmpty
                                    ? state.categories[i].image
                                    : 'https://via.placeholder.com/70',
                                onTap: () {
                                  context.read<ProductsCubit>().fetchByCategory(
                                      state.categories[i].name);
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (_) =>
                                        ProductListScreen(
                                        title: state.categories[i].name),
                                  ));
                                },
                              ),
                        ),
                ],

                const SizedBox(height: 20),

                SectionHeader(
                  title: 'Best for You',
                  onViewAll: () {
                    final List<
                        ProductModel> productsList = state is HomeDataSuccess
                        ? (state as HomeDataSuccess).products
                        : [];

                    Navigator.push(context, MaterialPageRoute(
                      builder: (_) =>
                          ProductListScreen(
                            title: 'Best for You',
                            products: productsList,
                          ),
                    ));
                  },
                ),
                const SizedBox(height: 12),
                if (state is HomeDataSuccess)
                  SizedBox(
                    height: 220,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.products
                          .skip(4)
                          .take(4)
                          .length,
                      separatorBuilder: (_, __) => const SizedBox(width: 12),
                      itemBuilder: (_, i) {
                        final product = state.products.skip(4).toList()[i];
                        return SizedBox(
                          width: 160,
                          child: _BestForYouCard(product: product),
                        );
                      },
                    ),
                  ),

                const SizedBox(height: 20),

                if (state is HomeDataSuccess) ...[
                  SectionHeader(
                    title: 'Brands',
                    onViewAll: () =>
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                AllBrandsScreen(brands: state.brands),
                          ),
                        ),
                  ),
                  const SizedBox(height: 12),
                  if (state is HomeDataSuccess)
                    SizedBox(
                      height: 70,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.brands.length,
                          separatorBuilder: (_, __) =>
                          const SizedBox(width: 12),
                          itemBuilder: (_, i) =>
                              BrandCard(
                                name: state.brands[i].name,
                                emoji: state.brands[i].emoji,
                                onTap: () {},
                              )
                      ),
                    ),
                ],
                const SizedBox(height: 20),

                SectionHeader(
                  title: 'Buy Again',
                  onViewAll: () {
                    final List<
                        ProductModel> productsList = state is HomeDataSuccess
                        ? (state as HomeDataSuccess).products
                        : [];

                    Navigator.push(context, MaterialPageRoute(
                      builder: (_) =>
                          ProductListScreen(
                            title: 'Buy Again',
                            products: productsList,
                          ),
                    ));
                  },
                ),
                const SizedBox(height: 12),
                if (state is HomeDataSuccess)
                  SizedBox(
                    height: 180,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.products
                          .take(4)
                          .length,
                      separatorBuilder: (_, __) => const SizedBox(width: 12),
                      itemBuilder: (_, i) =>
                          SizedBox(
                            width: 130,
                            child: _BestForYouCard(
                                product: state.products[i]

                            ),
                          ),
                    ),
                  ),

                const SizedBox(height: 24),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildOtherTab() {
    if (_currentIndex == 1) return const CartScreen();
    if (_currentIndex == 2) return const FavoritesScreen();
    final titles = ['', '', '', 'Menu'];
    return ProductListScreen(title: titles[_currentIndex]);
  }
}
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

          Expanded(
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(12)),
                  child: product.image.isNotEmpty
                      ? Image.network(
                    product.image,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                    errorBuilder: (_, __, ___) =>
                        Container(
                          color: Colors.grey.shade100,
                          child: const Icon(Icons.image_not_supported,
                              color: Colors.grey),
                        ),
                  )
                      : Container(
                    color: Colors.grey.shade100,
                    child: const Icon(Icons.image, color: Colors.grey),
                  ),
                ),

                Positioned(
                  top: 6,
                  right: 6,
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.08),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                      child: const Icon(Icons.favorite_outline,
                          size: 16, color: Colors.grey),
                    ),
                  ),
                ),
              ],
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

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${product.price} LE',
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryColor),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.star,
                            color: Colors.amber, size: 12),
                        const SizedBox(width: 2),
                        Text(
                          product.rating.toStringAsFixed(1),
                          style: TextStyle(
                              fontSize: 11, color: Colors.grey.shade600),
                        ),
                      ],
                    ),
                  ],
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
                            borderRadius: BorderRadius.circular(8)),
                        padding: EdgeInsets.zero,
                      ),
                      child: const Text('Add',
                          style:
                          TextStyle(fontSize: 12, color: Colors.white)),
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