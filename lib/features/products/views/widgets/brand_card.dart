import 'package:ecommerce_app/core/utils/app_assets.dart';
import 'package:flutter/material.dart';

class BrandCard extends StatelessWidget {
  final String image;
  final VoidCallback onTap;

  const BrandCard({super.key, required this.image, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Image.asset(
            AppAssets.Town_Team,
            fit: BoxFit.contain,
            errorBuilder: (_, __, ___) =>
                const Icon(Icons.store_outlined, color: Colors.grey),
          ),
        ),
      ),
    );
  }
}