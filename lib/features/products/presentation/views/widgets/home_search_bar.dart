import 'package:flutter/material.dart';
import 'package:ecommerce_app/core/utils/app_colors.dart';

class HomeSearchBar extends StatelessWidget {
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onSubmitted;

  const HomeSearchBar({
    super.key,
    this.controller,
    this.onChanged,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.scaffoldBackground,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.primaryColor),
      ),
      child: Row(
        children: [
          Icon(Icons.search, color: AppColors.blacktext, size: 20),
          const SizedBox(width: 10),

          Expanded(
            child: TextField(
              controller: controller,
              onChanged: onChanged,
              onSubmitted: (_) => onSubmitted?.call(),
              style: const TextStyle(color: AppColors.blacktext, fontSize: 14),
              cursorColor: AppColors.primaryColor,
              decoration: const InputDecoration(
                hintText: 'What are you looking for?',
                hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                border: InputBorder.none,
                isDense: true,
              ),
            ),
          ),

          Icon(Icons.tune_outlined, color: AppColors.blacktext, size: 20),
        ],
      ),
    );
  }
}