import 'package:architecture/Controller/widgets/blacktext-heading-widget.dart';
import 'package:architecture/Controller/widgets/button-widget.dart';
import 'package:architecture/Controller/widgets/normal-text-widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Controller/constants/app-colors/app-colors.dart';
import '../../../Controller/constants/app-loader/app-loader.dart';
import '../../../container.dart';
import '../../auth-view/signup-view/signup-view.dart';
import '../home-view/home-view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();Future.delayed(Duration(seconds: 4),(){Navigator.push(context,
        MaterialPageRoute(builder: (context)=>SignupView()));
    });}
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: AppColors.backGroundColor,
      body: Column(children: [ContainerClass(),
        Image.asset('assets/splashimg.png'),//height: 254,width: 354),
        SizedBox(height: 12,),
        BlackTextHeading(text: 'Get Things Done With Todo App'),
        SizedBox(height: 12,),
        NormalTextWidget(text: "Welcome to the ToDo App! Easily organize your \n"
            "tasks set priorities,and stay on top of your Goals, \n "
            "Let’s get started!",
          textColor: AppColors.primaryColor,),
        SizedBox(height: 10,),
        AppLoader(),
        SizedBox(height: 5,),
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