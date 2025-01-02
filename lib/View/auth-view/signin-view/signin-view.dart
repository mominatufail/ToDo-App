import 'package:flutter/material.dart';

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
             controller: emailController,


           )

         ],
       ),

     );
   }
 }
