import 'package:architecture/Controller/constants/app-loader/app-loader.dart';
import 'package:architecture/Controller/widgets/button-widget.dart';
import 'package:architecture/container.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_utils/get_utils.dart';

import '../../../Controller/constants/app-colors/app-colors.dart';
import '../../../Controller/widgets/blacktext-heading-widget.dart';
import '../../../Controller/widgets/normal-text-widget.dart';
import '../../../Controller/widgets/pass-field-widget.dart';
import '../../../Controller/widgets/textformfield-widget.dart';
import '../../starting-view/home-view/home-view.dart';
import '../signup-view/signup-view.dart';

 class LoginView extends StatefulWidget {
   const LoginView({super.key});
 
   @override
   State<LoginView> createState() => _LoginViewState();
 }
 
 class _LoginViewState extends State<LoginView> {
   TextEditingController emailController= TextEditingController();
   TextEditingController passwordController= TextEditingController();
   bool isLoading = false;

   @override
   Widget build(BuildContext context) {
     return Scaffold(backgroundColor: AppColors.backGroundColor,body:
     Center(child: Column(children: [Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
     ],),
       ContainerClass(),
       BlackTextHeading(text: 'Welcome Back!'),
       SizedBox(height: 8,),
       Image.asset('assets/3rd.png',height: 226,width: 211,),
       SizedBox(height: 10,),
       TextFormFieldWidget(hintText:    'Enter your Email Address', controller:emailController,),
       SizedBox(height: 5,),
       PasswordField(hintText: 'Enter your password', controller: passwordController),
       SizedBox(height: 20,),
       isLoading?AppLoader():ButtonWidget(text: 'Sign In', ontap: ()async{
         isLoading =true;setState(() {
         });
         await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text.trim(),
             password:passwordController.text.trim()).then((onValue){
           Navigator.push(context, CupertinoPageRoute(builder: (context)=> HomeView()));
         }).onError((value,error){
           isLoading =false;setState(() {
           });Get.snackbar('Error','${value.toString()}',backgroundColor: AppColors.primaryColor);
           print('Error'+value.toString());
         });
       }),
       SizedBox(height: 10,),
       Row(mainAxisAlignment: MainAxisAlignment.center,
           children: [
             NormalTextWidget(text: 'Don\'t have an Account ?', textColor:AppColors.primaryColor),
             SizedBox(width: 5,),
             InkWell(
                 onTap: (){
                   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignupView()));
                 },
                 child: NormalTextWidget(text: 'Sign Up',textColor:AppColors.blackColor ,)),
           ]),
     ],
     )),
     );
   }
 }

