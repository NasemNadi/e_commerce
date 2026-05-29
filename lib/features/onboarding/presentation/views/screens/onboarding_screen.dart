import 'package:ecommerce_app/core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../viewmodels/onboarding_viewmodel.dart';
import '../widgets/onboarding_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => OnboardingViewModel(),
      child: Consumer<OnboardingViewModel>(
        builder: (context, vm, _) {
          return Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  // PageView
                  Expanded(
                    child: PageView.builder(
                      controller: _pageController,
                      onPageChanged: vm.setPage,
                      itemCount: vm.pages.length,
                      itemBuilder: (_, i) =>
                          OnboardingPage(model: vm.pages[i]),
                    ),
                  ),

                  // Dots
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      vm.pages.length,
                      (i) => AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: vm.currentPage == i ? 20 : 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: vm.currentPage == i
                              ? Theme.of(context).colorScheme.primary
                              : Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 32),

                  // Button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: CustomButton(
                      text: vm.isLastPage ? 'Get Start' : 'Next',
                      onPressed: () {
                        if (vm.isLastPage) {
                         Navigator.pushReplacementNamed(context, AppRoutes.login);
                        } else {
                          vm.nextPage(_pageController);
                        }
                      },
                    ),
                  ),

                  const SizedBox(height: 24),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}