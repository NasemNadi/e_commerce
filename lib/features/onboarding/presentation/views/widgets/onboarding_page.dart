import 'package:flutter/material.dart';
import '../../../data/models/onboarding_model.dart';

class OnboardingPage extends StatelessWidget {
  final OnboardingModel model;
 
  const OnboardingPage({super.key, required this.model});
 
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(model.image, height: 300),
          const SizedBox(height: 40),
          Text(
            model.title,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: Colors.black),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            model.subtitle,
            style: const TextStyle(fontSize: 16, color: Colors.black),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
 