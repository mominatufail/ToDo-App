import 'package:architecture/Controller/constants/app-colors/app-colors.dart';
import 'package:architecture/Controller/constants/app-loader/app-loader.dart';
import 'package:architecture/Controller/widgets/blacktext-heading-widget.dart';
import 'package:architecture/Controller/widgets/button-widget.dart';
import 'package:architecture/Controller/widgets/image-widget.dart';
import 'package:architecture/Controller/widgets/normal-text-widget.dart';
import 'package:architecture/Controller/widgets/textformfield-widget.dart';
import 'package:architecture/View/auth-view/signin-view/signin-view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignupView extends StatefulWidget {
  SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  TextEditingController fullNameController= TextEditingController();

  TextEditingController emailController= TextEditingController();

  TextEditingController passwordController= TextEditingController();

  bool isloading= false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        SizedBox(height: 30,),
        BlackTextHeading(text: 'Welcome Onboard!'),
        SizedBox(height: 20,),
        NormalTextWidget(text: 'Let’s help you meet up your task',textColor: AppColors.primaryColor,),
        //TextFormFieldWidget(hintText: 'Enter your Full Name', controller:fullNameController),
        TextFormFieldWidget(hintText: 'Enter your Email address ', controller:emailController),
        TextFormFieldWidget(hintText: 'Create a Password', controller:passwordController),
        //TextFormFieldWidget(hintText: 'Confirm your Password', controller:fullNameController),
         SizedBox(height: 10,),

        isloading?AppLoader():ButtonWidget(
            text: 'SignUp',
            ontap: () async {
              isloading = true;
              setState(() {});


          await FirebaseAuth.instance.
          createUserWithEmailAndPassword(
              email: emailController.text.trim(),
              password: passwordController.text).then((value) {
                isloading = false;
                setState(() {});
                Navigator.push(context, CupertinoPageRoute(
                    builder: (context) => LoginView()));
                

              }).onError((value,error){
                isloading = false;
                setState(() {});

                });


              }),

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
