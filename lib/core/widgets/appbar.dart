import 'package:ecommerce_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class App_bar extends StatelessWidget implements PreferredSizeWidget {
  final String titel;
 final List<Widget>? actions;
 final Widget? leadingWidget;
  const App_bar({
    super.key, 
    required this.titel,
     this.actions,
      this.leadingWidget,
       });


  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leadingWidget,
      title: Text(titel),
      actions:actions,
      backgroundColor: AppColors.scaffoldBackground,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}