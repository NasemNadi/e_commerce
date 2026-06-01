import 'package:flutter/material.dart';
import 'package:ecommerce_app/core/utils/app_colors.dart';
import 'package:ecommerce_app/core/widgets/appbar.dart';
import 'package:ecommerce_app/core/widgets/custom_button.dart';

class CartItemModel {
  final String image;
  final String name;
  final String subtitle;
  final double price;
  final double rating;
  int quantity;

  CartItemModel({
    required this.image,
    required this.name,
    required this.subtitle,
    required this.price,
    required this.rating,
    this.quantity = 1,
  });
}

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final List<CartItemModel> _items = [
    CartItemModel(
      image: 'https://cdn.dummyjson.com/product-images/beauty/essence-mascara-lash-princess/thumbnail.webp',
      name: 'Pampers Swaddlers',
      subtitle: '84 Diapers',
      price: 345,
      rating: 4.9,
      quantity: 1,
    ),
    CartItemModel(
      image: 'https://cdn.dummyjson.com/product-images/beauty/eyeshadow-palette-with-mirror/thumbnail.webp',
      name: 'Seventh Generation',
      subtitle: '24 Diapers',
      price: 88,
      rating: 4.6,
      quantity: 2,
    ),
    CartItemModel(
      image: 'https://cdn.dummyjson.com/product-images/beauty/powder-canister/thumbnail.webp',
      name: 'Seventh Generation',
      subtitle: '152 Diapers',
      price: 599,
      rating: 4.8,
      quantity: 1,
    ),
  ];

  double get _subtotal =>
      _items.fold(0, (sum, item) => sum + item.price * item.quantity);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: App_bar(titel: 'Cart'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Text(
              'Products on Cart',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),

          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: _items.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (_, i) => _CartItemCard(
                item: _items[i],
                onIncrement: () => setState(() => _items[i].quantity++),
                onDecrement: () => setState(() {
                  if (_items[i].quantity > 1) _items[i].quantity--;
                }),
                onDelete: () => setState(() => _items.removeAt(i)),
              ),
            ),
          ),

          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, -4),
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Subtotal (${_items.length} items)',
                      style: const TextStyle(
                          fontSize: 14, color: Colors.black87),
                    ),
                    Text(
                      'EGP ${_subtotal.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                // Checkout Button
                CustomButton(
                  text: 'Checkout',
                  onPressed: () {
                    // TODO: Navigate to Checkout
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CartItemCard extends StatelessWidget {
  final CartItemModel item;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final VoidCallback onDelete;

  const _CartItemCard({
    required this.item,
    required this.onIncrement,
    required this.onDecrement,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              item.image,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                width: 80,
                height: 80,
                color: AppColors.primaryColor.withOpacity(0.1),
                child: const Icon(Icons.image_not_supported,
                    color: Colors.grey),
              ),
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        item.name,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const Icon(Icons.favorite_outline,
                        size: 18, color: Colors.grey),
                  ],
                ),

                const SizedBox(height: 2),

                Text(
                  item.subtitle,
                  style: TextStyle(
                      fontSize: 11, color: Colors.grey.shade500),
                ),

                const SizedBox(height: 4),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Price: ${item.price.toStringAsFixed(2)} EGP',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.star,
                            color: Colors.amber, size: 12),
                        const SizedBox(width: 2),
                        Text(
                          item.rating.toStringAsFixed(1),
                          style: TextStyle(
                              fontSize: 11, color: Colors.grey.shade600),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                Row(
                  children: [
                    GestureDetector(
                      onTap: onDelete,
                      child: Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          color: Colors.red.shade50,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.red.shade200),
                        ),
                        child: Icon(Icons.delete_outline,
                            color: Colors.red.shade400, size: 18),
                      ),
                    ),

                    const SizedBox(width: 12),

                    Row(
                      children: [
                        GestureDetector(
                          onTap: onDecrement,
                          child: Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(8),
                              border:
                              Border.all(color: Colors.grey.shade300),
                            ),
                            child: const Icon(Icons.remove, size: 16),
                          ),
                        ),

                        Container(
                          width: 40,
                          height: 32,
                          alignment: Alignment.center,
                          child: Text(
                            '${item.quantity}',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        GestureDetector(
                          onTap: onIncrement,
                          child: Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Icon(Icons.add,
                                size: 16, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}