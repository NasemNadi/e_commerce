import 'package:flutter/material.dart';
import 'package:ecommerce_app/core/utils/app_assets.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: AssetImage(AppAssets.scrolled_offer),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}