import 'package:architecture/Controller/constants/app-colors/app-colors.dart';
import 'package:architecture/Controller/constants/app-images/app-images.dart';
import 'package:architecture/Controller/widgets/blacktext-heading-widget.dart';
import 'package:architecture/Controller/widgets/button-widget.dart';
import 'package:architecture/Controller/widgets/image-widget.dart';
import 'package:architecture/View/auth-view/signup-view/signup-view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Controller/constants/app-loader/app-loader.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //initial state function
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   Future.delayed(Duration(seconds: 3),(){
  //     Navigator.push(context, MaterialPageRoute(builder: (context)=>SignupView()));
  //
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: Center(
        child:
        Column(
          children: [

            SizedBox(height: 50,),
            ImageWidget(image: AppImages.splashImg),
            SizedBox(height: 30,),
            BlackTextHeading(text:'Get things done with TODo'),
            SizedBox(height: 30,),
            //CircularProgressIndicator(//backgroundColor: AppColors.primaryColor,
             // color: AppColors.secondaryColor ,),

            AppLoader(),  //call this widget for loading effect
            SizedBox(height: 15,),



            //SpinKitCircle(color: AppColors.primaryColor),

            //Padding(
              //padding: const EdgeInsets.all(8.0),
              //child: BlackTextHeading(text:'Lorem ipsum dolor sit amet,consectetur adipisicing. Maxime,tempore! Animi nemo aut atque,deleniti nihil dolorem repellendus.'),
            //),

            ButtonWidget(text: 'Get Started',
                ontap: () async {
              await FirebaseAuth.instance.currentUser;
              Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>SignupView()));
            }),


          ],
        ) ,
      ),
    );
  }
}
