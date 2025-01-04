import 'package:architecture/Controller/constants/app-loader/app-loader.dart';
import 'package:architecture/Controller/widgets/button-widget.dart';
import 'package:architecture/container.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

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
     return Scaffold(
       body: Column(
         children: [
           TextFormField(
             controller: emailController
       ),
       SizedBox(height: 16,),
       TextFormField(
         controller: passwordController,
         obscureText: true),
           isLoading?AppLoader():
           ButtonWidget(text: 'Login', ontap:() async{
             isLoading = true;
             setState(() {

             });FirebaseAuth.instance.signInWithEmailAndPassword(
                 email: emailController.text.trim(),
                 password: passwordController.text).then((onValue) {
     Navigator.pushReplacement(
     context, CupertinoPageRoute(
     builder: (context)=>ContainerClass()));
     }).onError((value,error) {});

             })

       ],),

     );

   }
 }
