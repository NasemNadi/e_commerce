import 'package:ecommerce_app/core/routes/app_routes.dart';
import 'package:ecommerce_app/core/utils/app_assets.dart';
import 'package:ecommerce_app/core/utils/app_colors.dart';
import 'package:ecommerce_app/core/widgets/appbar.dart';
import 'package:ecommerce_app/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import 'package:pin_code_fields/pin_code_fields.dart';


class VerifcationCodeScreen extends StatelessWidget {
  const VerifcationCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:App_bar(titel: 'Verification Code',leadingWidget: Icon(Icons.arrow_back_ios_new),) ,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          SizedBox(height: 40,),
          Image.asset(AppAssets.verificationcode),
          SizedBox(height: 30,),
          Center(child: Text('Please enter the 4 digit code \n sent to: You@gmail.com', textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        height: 1.6,
                      ),)),

                   PinCodeTextField(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  appContext: context,
  length: 4,
  obscureText: false,
  animationType: AnimationType.fade,
  keyboardType: TextInputType.number,
  enableActiveFill: true,             
  pinTheme: PinTheme(
    shape: PinCodeFieldShape.box,
    borderRadius: BorderRadius.circular(8),
    fieldHeight: 60,
    fieldWidth: 50,
    activeFillColor: AppColors.borderGrey,
    inactiveFillColor: AppColors.borderGrey,
    selectedFillColor: AppColors.borderGrey,
    inactiveColor: Colors.grey.shade300,
    activeColor: AppColors.primaryColor,
    selectedColor: AppColors.primaryColor,
  ),
  onChanged: (value) {},
),
        SizedBox(height: 30,),
        CustomButton(text: "verify code",
         onPressed: (){
          Navigator.pushNamedAndRemoveUntil(context, AppRoutes.login, (route) => false);
         },
         ),
         SizedBox(height: 30,),
         GestureDetector(
                      onTap: () {
                      },
                      child: const Text(
                        "Resend Code",
                        style: TextStyle(
                          color:AppColors.primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    )
        ],
      ),
    );
  }
}