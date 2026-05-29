import 'package:flutter/material.dart';
import 'package:ecommerce_app/features/products/data/models/product_model.dart';
import 'package:ecommerce_app/core/utils/app_colors.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  final VoidCallback onTap;
  final bool showAddButton;
  final bool showDiscount;

  const ProductCard({
    super.key,
    required this.product,
    required this.onTap,
    this.showAddButton = false,
    this.showDiscount = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color:  AppColors.primaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade200), // ← رمادي مش أزرق
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // ── صورة + badges ─────────────────────
            Expanded(
              child: Stack(
                children: [
                  // الصورة
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(12)),
                    child: product.image.isNotEmpty
                        ? Image.network(
                      product.image,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                      errorBuilder: (_, __, ___) => Container(
                        color: AppColors.primaryColor.withOpacity(0.1),
                        child: const Icon(Icons.image_not_supported,
                            color: Colors.grey),
                      ),
                    )
                        : Container(color: Colors.grey.shade100),
                  ),

                  // Discount Badge — فوق شمال
                  if (showDiscount && product.discountPercentage > 0)
                    Positioned(
                      top: 6,
                      left: 6,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          '${product.discountPercentage.toInt()}% OFF',
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 9,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),

                  // Favorite Button — فوق يمين
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

            // ── بيانات المنتج ─────────────────────
            Padding(
              padding: const EdgeInsets.all(8),
              child:
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // السعر
                  Text(
                    '${product.price} LE',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: AppColors.blacktext,
                    ),
                  ),

                  const SizedBox(height: 2),

                  // الاسم
                  Text(
                    product.name,
                    style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: AppColors.blacktext),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),

                  const SizedBox(height: 4),
                  const Icon(Icons.star, color: Colors.amber, size: 12),
                  const SizedBox(width: 2),
                  Text(
                    product.rating.toStringAsFixed(1),
                    style: TextStyle(
                        fontSize: 11, color: Colors.grey.shade600),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}