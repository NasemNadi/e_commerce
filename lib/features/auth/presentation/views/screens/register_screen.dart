import 'package:ecommerce_app/core/utils/app_assets.dart';
import 'package:ecommerce_app/core/utils/app_colors.dart';
import 'package:ecommerce_app/core/widgets/TextFormField.dart';
import 'package:flutter/material.dart';

import '../../../../../core/network/api_errors.dart';
import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../data/models/auth_repo.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _nameController            = TextEditingController();
  final _usernameController        = TextEditingController();
  final _phoneController           = TextEditingController();
  final _emailController           = TextEditingController();
  final _passwordController        = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey                   = GlobalKey<FormState>();
  final AuthRepo _authRepo = AuthRepo();
  bool _isLoading = false;
  @override
  void dispose() {
    _nameController.dispose();
    _usernameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
  Future<void> _signUp() async {
    setState(() => _isLoading = true); // شغل الأنميشن بتاع الـ Loading

    try {
      final user = await _authRepo.register(
        name: _nameController.text.trim(),
        username: _usernameController.text.trim(),
        phone: _phoneController.text.trim(),
        email: _emailController.text.trim(),
        password: _passwordController.text,
        confirmPassword: _confirmPasswordController.text
      );

      if (user != null) {
        Navigator.pushNamedAndRemoveUntil(context, AppRoutes.home, (route) => false);
      }
    } catch (e) {
      String errMsg = 'Unhandled registration error';
      if (e is ApiErrors) {
        errMsg = e.message;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errMsg), backgroundColor: Colors.red),
      );
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // ── Back Button ───────────────────────
              Padding(
                padding: const EdgeInsets.only(left: 8, top: 12),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back_ios_new_rounded,
                        size: 20, color: Colors.black87),
                  ),
                ),
              ),

              // ── Logo ──────────────────────────────
              Image.asset(AppAssets.logo, height: 100),

              const SizedBox(height: 24),

              // ── Form ──────────────────────────────
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      // Your Name
                      const _FieldLabel(text: 'Your Name'),
                      CustomTextField(
                        hintText: 'Full Name',
                        prefixIcon: Icons.person_outline,
                        controller: _nameController,
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'Enter your name';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 14),

                      // Username
                      const _FieldLabel(text: 'Username'),
                      CustomTextField(
                        hintText: 'Username',
                        prefixIcon: Icons.person_outline,
                        controller: _usernameController,
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'Enter a username';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 14),

                      // Phone Number
                      const _FieldLabel(text: 'Phone Number'),
                      CustomTextField(
                        hintText: '+20 150 1142409',
                        prefixIcon: Icons.phone_outlined,
                        controller: _phoneController,
                        keyboardType: TextInputType.phone,
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'Enter your phone number';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 14),

                      // Email
                      const _FieldLabel(text: 'Email'),
                      CustomTextField(
                        hintText: 'You@gmail.com',
                        prefixIcon: Icons.email_outlined,
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'Enter your email';
                          }
                          if (!val.contains('@')) {
                            return 'Enter a valid email';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 14),

                      // Password
                      const _FieldLabel(text: 'Password'),
                      CustomTextField(
                        hintText: 'Password',
                        prefixIcon: Icons.lock_outline,
                        isPassword: true,
                        controller: _passwordController,
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'Enter your password';
                          }
                          if (val.length < 6) {
                            return 'At least 6 characters';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 14),

                      // Confirm Password
                      const _FieldLabel(text: 'Confirm Password'),
                      CustomTextField(
                        hintText: 'Confirm Password',
                        prefixIcon: Icons.lock_outline,
                        isPassword: true,
                        controller: _confirmPasswordController,
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'Confirm your password';
                          }
                          if (val != _passwordController.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 24),

                      // Sign Up Button
                      CustomButton(
                        text: 'Sign Up',
                        isLoading: _isLoading, // 👈 ربطنا الـ Loading بالزرار هنا
                        onPressed: () {
                          // التأكد من صحة الحقول أولاً محلياً
                          if (_formKey.currentState!.validate() && !_isLoading) {
                            _signUp(); // مناداة ميثود الـ API
                          }
                        },
                      ),

                      const SizedBox(height: 20),

                      // Or Continue With
                      Row(
                        children: [
                          Expanded(child: Divider(color: Colors.grey.shade300)),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: Text(
                              'Or Continue With',
                              style: TextStyle(color: AppColors.borderGrey, fontSize: 13),
                            ),
                          ),
                          Expanded(child: Divider(color: Colors.grey.shade300)),
                        ],
                      ),

                      const SizedBox(height: 20),

                      Center(child: Image.asset(AppAssets.register_icon)),

                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Field Label ───────────────────────────────────────
class _FieldLabel extends StatelessWidget {
  final String text;
  const _FieldLabel({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),
      ),
    );
  }
}