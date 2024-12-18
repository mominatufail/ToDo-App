import 'package:architecture/Controller/constants/app-colors/app-colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonWidget extends StatelessWidget {
  String text;
  VoidCallback ontap;
  ButtonWidget({super.key,
    required this.text, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap ,
      child: Container(
        height: 44, width: 220,
        color: AppColors.primaryColor,
        child: Center(child: Text(text,style: GoogleFonts.poppins(
          color: AppColors.secondaryColor,
          fontSize: 14,
          fontWeight: FontWeight.w500
        ),),),
      )

    );
  }
}
