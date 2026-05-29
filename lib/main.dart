import 'package:ecommerce_app/core/routes/app_routes.dart';
import 'package:ecommerce_app/core/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/auth/data/models/auth_repo.dart';
import 'features/auth/presentation/cubits/auth_cubit.dart';
import 'features/products/presentation/cubits/product_cubit.dart';

void main() {
  runApp(
  
       MyApp(),
    
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => AuthCubit(AuthRepo())),
          BlocProvider(create: (_) => ProductsCubit()..fetchAllProducts()),

        ],
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: AppRoutes.onboarding,
      routes: AppRoutes.routes,
      )
    );
  }
}