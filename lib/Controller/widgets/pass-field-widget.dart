import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constants/app-colors/app-colors.dart';

class PasswordField extends StatefulWidget {
  String hintText;
  bool select=true;
  TextEditingController controller;
  PasswordField({super.key,required this.hintText,required this.controller});
  @override
  State<PasswordField> createState() => _PasswordFieldState();
}
class _PasswordFieldState extends State<PasswordField> {
  bool isHide = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 28.0,vertical: 8),
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.secondaryColor,
            borderRadius: BorderRadius.circular(10)
        ),
        child: TextFormField(controller:widget.controller,
          obscureText: isHide,
          decoration: InputDecoration(hintText: widget.hintText,
              contentPadding:EdgeInsets.only(left:8,top: 10),border: InputBorder.none,
              hintStyle: TextStyle(color: AppColors.blackColor),
              suffixIcon: IconButton(onPressed: (){
                if(isHide==true){
                  isHide=false;
                }
                else
                {
                  isHide=true;
                }setState(() {

                });
              }, icon:isHide==false?
              Icon(CupertinoIcons.eye_fill):Icon(CupertinoIcons.eye_slash_fill))
          ),
        ),
      ),
    );

  }
}