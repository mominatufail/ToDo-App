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
     return Scaffold(backgroundColor: AppColors.backGroundColor,
       body: Column(children: [ContainerClass(),
         Image.asset('assets/1st.png',height: 254,width: 354,),
         SizedBox(height: 30,),
         BlackTextHeading(text: 'Get Things Done With Todo App'),
         SizedBox(height: 15,),
         NormalTextWidget(text: "Welcome to Todo App! Organize tasks, \n"
             "set priorities,and stay on track effortlessly.\n "
             "Let’s get started!",
           textColor: AppColors.primaryColor,),
         SizedBox(height: 20,),
         AppLoader(),
         SizedBox(height: 10,),
         ButtonWidget(text: 'Get Started', ontap: () async {
           User? check= await FirebaseAuth.instance.currentUser;
           if(check==null){Navigator.push(context,
               MaterialPageRoute(builder: (context)=>SignupView()));
           }
           else{
             Navigator.push(context,
                 MaterialPageRoute(builder: (context)=>HomeView()));}
         }),        ],
       ),
     );
   }
 }
