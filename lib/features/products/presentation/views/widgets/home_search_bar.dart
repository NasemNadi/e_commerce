import 'package:flutter/material.dart';
import 'package:ecommerce_app/core/utils/app_colors.dart';

class HomeSearchBar extends StatelessWidget {
  final VoidCallback onTap;

  const HomeSearchBar({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 48,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color:AppColors.scaffoldBackground,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.primaryColor),
        ),
        child: Row(
          children: [
            Icon(Icons.search, color:AppColors.blacktext, size: 20),
            const SizedBox(width: 10),
            Text(
              'What are you looking for?',
              style: TextStyle(color: AppColors.blacktext
                  , fontSize: 14),
            ),
            const Spacer(),
            Icon(Icons.tune_outlined, color:AppColors.blacktext, size: 20),
          ],
        ),
      ),
    );
  }
}