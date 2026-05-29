import 'package:flutter/material.dart';

class BrandCard extends StatelessWidget {
  final String name;  // 👈 استبدلنا الصورة باسم البراند (مثال: Chanel)
  final String emoji; // 👈 واستبدلناها بالإيموجي اللي جاي من الـ API (مثال: 👗)
  final VoidCallback onTap;

  const BrandCard({
    super.key,
    required this.name,
    required this.emoji,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade200),
          borderRadius: BorderRadius.circular(12), // خليناه دائري أكتر عشان يبقى عصري
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.02),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min, // عشان الكارت ياخد مساحة الكلام بالظبط
          children: [
            // 1️⃣ عرض الإيموجي كأنه لوجو مكبر
            Text(
              emoji,
              style: const TextStyle(fontSize: 22),
            ),
            const SizedBox(width: 8),

            // 2️⃣ عرض اسم البراند بجانبه
            Text(
              name,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}