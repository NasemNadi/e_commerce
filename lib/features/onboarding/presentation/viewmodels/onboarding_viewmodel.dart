import 'package:ecommerce_app/core/utils/app_assets.dart';
import 'package:flutter/material.dart';
import '../../data/models/onboarding_model.dart';

class OnboardingViewModel extends ChangeNotifier {
  int _currentPage = 0;
  int get currentPage => _currentPage;
 
  final List<OnboardingModel> pages = [
    OnboardingModel(
      image:  AppAssets.onboarding_1, 
          title: 'Welcome to Marketi',
      subtitle:
          'Discover a world of endless possibilities and shop from the comfort of your fingertips',
    ),
    OnboardingModel(
      image: AppAssets.onboarding_2,
      title: 'Easy to Buy',
      subtitle:
          'Find the perfect item that suits your style and needs with secure payment options',
    ),
    OnboardingModel(
      image: AppAssets.onboarding_3,
      title: 'Wonderful User Experience',
      subtitle:
          'Start exploring now and experience the convenience of online shopping at its best',
    ),
  ];
 
  bool get isLastPage => _currentPage == pages.length - 1;
 
  void setPage(int index) {
    _currentPage = index;
    notifyListeners();
  }
 
  void nextPage(PageController controller) {
    controller.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}