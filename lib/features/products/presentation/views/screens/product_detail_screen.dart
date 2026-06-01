import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_app/core/utils/app_colors.dart';
import 'package:ecommerce_app/core/widgets/custom_button.dart';
import 'package:ecommerce_app/features/products/data/models/product_model.dart';
import 'package:ecommerce_app/features/products/presentation/cubits/FavoritesCubit.dart';

class ProductDetailScreen extends StatefulWidget {
  final ProductModel product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int _selectedSize = 1;
  int _quantity = 1;
  int _currentImage = 0;

  final List<int> _sizes = [3, 2, 4];

  @override
  Widget build(BuildContext context) {
    final product = widget.product;

    return BlocBuilder<FavoritesCubit, List<ProductModel>>(
      builder: (context, favorites) {
        final isFavorite = favorites.any((p) => p.id == product.id);

        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
              icon: Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: const Icon(Icons.arrow_back_ios_new_rounded,
                    size: 16, color: Colors.black87),
              ),
              onPressed: () => Navigator.pop(context),
            ),
            title: const Text(
              'Product Details',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Stack(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.shopping_cart_outlined,
                          color: Colors.black87),
                      onPressed: () {},
                    ),
                    Positioned(
                      right: 6,
                      top: 6,
                      child: Container(
                        width: 16,
                        height: 16,
                        decoration: const BoxDecoration(
                          color: AppColors.primaryColor,
                          shape: BoxShape.circle,
                        ),
                        child: const Center(
                          child: Text('0',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 10)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Container(
                  height: 260,
                  color: AppColors.primaryColor.withOpacity(0.08),
                  child: Stack(
                    children: [
                      // الصورة الرئيسية
                      Center(
                        child: product.image.isNotEmpty
                            ? Image.network(
                          product.image,
                          height: 220,
                          fit: BoxFit.contain,
                          errorBuilder: (_, __, ___) => const Icon(
                              Icons.image_not_supported,
                              size: 80,
                              color: Colors.grey),
                        )
                            : const Icon(Icons.image,
                            size: 80, color: Colors.grey),
                      ),

                      // Favorite Button
                      Positioned(
                        top: 12,
                        right: 12,
                        child: GestureDetector(
                          onTap: () => context
                              .read<FavoritesCubit>()
                              .toggleFavorite(product),
                          child: Container(
                            width: 36,
                            height: 36,
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
                            child: Icon(
                              isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_outline,
                              size: 18,
                              color: isFavorite ? Colors.red : Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 12),
                  child: Row(
                    children: List.generate(
                      3,
                          (i) => GestureDetector(
                        onTap: () => setState(() => _currentImage = i),
                        child: Container(
                          margin: const EdgeInsets.only(right: 8),
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor.withOpacity(0.08),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: _currentImage == i
                                  ? AppColors.primaryColor
                                  : Colors.transparent,
                              width: 2,
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: product.image.isNotEmpty
                                ? Image.network(product.image,
                                fit: BoxFit.cover)
                                : const Icon(Icons.image, color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.green.shade50,
                              borderRadius: BorderRadius.circular(20),
                              border:
                              Border.all(color: Colors.green.shade200),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.local_shipping_outlined,
                                    size: 14, color: Colors.green.shade600),
                                const SizedBox(width: 4),
                                Text(
                                  'Free Shipping',
                                  style: TextStyle(
                                      fontSize: 11,
                                      color: Colors.green.shade600,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),

                          // Rating
                          Row(
                            children: List.generate(5, (i) {
                              return Icon(
                                i < product.rating.floor()
                                    ? Icons.star
                                    : Icons.star_border,
                                color: Colors.amber,
                                size: 16,
                              );
                            })
                              ..add(
                                Text(
                                  ' (${product.rating.toStringAsFixed(1)})',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey.shade600),
                                ),
                              ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 12),

                      Text(
                        product.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),

                      const SizedBox(height: 8),

                      // ── Product Value ─────────────────
                      const Text(
                        'Product Value',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87),
                      ),

                      const SizedBox(height: 6),

                      Text(
                        product.description,
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey.shade600,
                            height: 1.5),
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      ),

                      const SizedBox(height: 4),

                      GestureDetector(
                        onTap: () {},
                        child: const Text(
                          'See more',
                          style: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 13,
                              fontWeight: FontWeight.w500),
                        ),
                      ),

                      const SizedBox(height: 16),

                      // ── Select Size ───────────────────
                      const Text(
                        'Select Size',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87),
                      ),

                      const SizedBox(height: 8),

                      Row(
                        children: _sizes.map((size) {
                          final isSelected = _selectedSize == size;
                          return GestureDetector(
                            onTap: () =>
                                setState(() => _selectedSize = size),
                            child: Container(
                              margin: const EdgeInsets.only(right: 8),
                              width: 44,
                              height: 44,
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? AppColors.primaryColor
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: isSelected
                                      ? AppColors.primaryColor
                                      : Colors.grey.shade300,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  '$size',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: isSelected
                                        ? Colors.white
                                        : Colors.black87,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),

                      const SizedBox(height: 20),

                      Row(
                        children: [
                          // Price
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Price',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.grey),
                              ),
                              Text(
                                '${product.price.toStringAsFixed(2)} EGP',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(width: 16),

                          // Add to Cart Button
                          Expanded(
                            child: CustomButton(
                              text: '🛒  Add to Cart',
                              onPressed: () {
                                // TODO: Add to Cart
                              },
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}