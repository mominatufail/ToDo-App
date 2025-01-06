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
import 'package:get/get.dart';

import '../../../Controller/widgets/pass-field-widget.dart';
import '../../../container.dart';
import '../../starting-view/home-view/home-view.dart';

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
    return Scaffold(backgroundColor: AppColors.backGroundColor,
      body: Column(children: [ContainerClass(),
        BlackTextHeading(text: 'Welcome Onboard!'),
        SizedBox(height: 35,),
        NormalTextWidget(text: 'Let’s help you meet up your task', textColor: AppColors.primaryColor,),
        SizedBox(height: 35,),
        TextFormFieldWidget(hintText:    'Enter your Full Name', controller:fullNameController),
        SizedBox(height: 8,),
        TextFormFieldWidget(hintText:   'Enter your Email address ', controller:emailController),
        SizedBox(height: 8,),
        PasswordField(hintText: 'Enter your password', controller: passwordController),
        SizedBox(height: 8,),
        //TextFormFieldWidget(hintText: 'Confirm your Password', controller:ConfirmPassController),
        SizedBox(height: 8,),
        SizedBox(height: 8,),
        isloading?AppLoader():ButtonWidget(text: 'Sign Up', ontap: ()async { isloading =true;
        setState((){});
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim()).then((value){isloading =false;setState(() {
        });Navigator.push(context, CupertinoPageRoute(builder: (context)=>HomeView()));
        }).onError((value,error){
          isloading =false;setState(() {
          });Get.snackbar('Error','${value.toString()}',backgroundColor: AppColors.primaryColor);
          // print('Error'+'${value.toString()}');
        });
        }),
        SizedBox(height: 10,),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NormalTextWidget(text: 'Already have an account?', textColor:AppColors.primaryColor),
              SizedBox(width: 5,),
              InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginView()));
                  },
                  child: NormalTextWidget(text: 'Sign in',textColor:AppColors.blackColor ,))
            ]
        ),
      ],),);
  }
}