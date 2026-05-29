import 'package:flutter/material.dart';
import 'package:ecommerce_app/core/utils/app_colors.dart';

class HomeHeader extends StatelessWidget {
  final String userName;

  const HomeHeader({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            // صورة المستخدم
            CircleAvatar(
              radius: 22,
              backgroundColor: AppColors.primaryColor.withOpacity(0.1),
              child: const Icon(Icons.person, color: AppColors.primaryColor),
            ),
            const SizedBox(width: 10),
            Text(
              'Hi $userName !',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ],
        ),
        // Bell Icon
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: const Icon(Icons.notifications_none_outlined,
              color: Colors.black87, size: 22),
        ),
      ],
    );
  }
}