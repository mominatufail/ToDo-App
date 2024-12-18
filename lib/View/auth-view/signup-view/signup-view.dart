import 'package:architecture/Controller/constants/app-colors/app-colors.dart';
import 'package:architecture/Controller/widgets/blacktext-heading-widget.dart';
import 'package:architecture/Controller/widgets/button-widget.dart';
import 'package:architecture/Controller/widgets/image-widget.dart';
import 'package:architecture/Controller/widgets/normal-text-widget.dart';
import 'package:architecture/Controller/widgets/textformfield-widget.dart';
import 'package:flutter/material.dart';

class SignupView extends StatelessWidget {
  SignupView({super.key});
  TextEditingController fullNameController= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        SizedBox(height: 30,),
        BlackTextHeading(text: 'Welcome Onboard!'),
        SizedBox(height: 20,),
        NormalTextWidget(text: 'Let’s help you meet up your task',textColor: AppColors.primaryColor,),
        TextFormFieldWidget(hintText: 'Enter your Full Name', controller:fullNameController),
        TextFormFieldWidget(hintText: 'Enter your Email address ', controller:fullNameController),
        TextFormFieldWidget(hintText: 'Create a Password', controller:fullNameController),
        TextFormFieldWidget(hintText: 'Confirm your Password', controller:fullNameController),
         SizedBox(height: 10,),
        ButtonWidget(text: 'SignUp', ontap: (){}),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
          NormalTextWidget(text: 'Already have an account?', textColor: AppColors.blackColor),
          SizedBox(width: 5,),
          InkWell(
            onTap: (){

            },
            child:
            NormalTextWidget(text: 'Sign In', textColor: AppColors.primaryColor)
          ),]

    ),

        ],),);
  }
}
