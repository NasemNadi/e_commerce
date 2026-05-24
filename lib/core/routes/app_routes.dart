import 'package:ecommerce_app/features/products/views/screens/home_scren.dart';
import 'package:ecommerce_app/features/onboarding/views/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';

import '../../features/auth/presentation/views/screens/forget_password_screen.dart';
import '../../features/auth/presentation/views/screens/login_screen.dart';
import '../../features/auth/presentation/views/screens/register_screen.dart';
import '../../features/auth/presentation/views/screens/verifcation_code_screen.dart';

class AppRoutes {
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String register = '/register';
  static const String forgetPassword = '/forget-password';
  static const String verificationCode = '/verification-code';
  static const String home = '/home';

  static Map<String, WidgetBuilder> get routes {
    return {
      onboarding: (context) => const OnboardingScreen(),
      login: (context) => const LoginScreen(),
      register: (context) => const RegisterScreen(),
      forgetPassword: (context) => const ForgetPassword(),
      verificationCode: (context) => const VerifcationCodeScreen(),
      home: (context) => const HomeScreen(),
    };
  }
}