import 'package:architecture/Controller/constants/app-colors/app-colors.dart';
import 'package:flutter/material.dart';

class ContainerClass extends StatelessWidget {
  const ContainerClass({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
      Column(children: [
      Container(
      height: 400, width: double.infinity,
        color: AppColors.primaryColor,
      )
      ],),
        Container(
          height: 100, width: 200,
          decoration: BoxDecoration(color: Colors.blue,//.opacity(0.5),
            borderRadius: BorderRadius.only(
                //topRight: Radius.circular(100),// if we do 200 it will become lemon or leaf type
              bottomLeft: Radius.circular(100),
              bottomRight: Radius.circular(10),))
               //topLeft: Radius.circular(10)
      ),
       Container(
        height: 100,
        width: 200,
        decoration: BoxDecoration( color: Colors.blue.withOpacity(0.5),
        borderRadius: BorderRadius.only(
      topRight: Radius.circular(200), bottomRight: Radius.circular(200)),
        ),),


      ],)


    );

  }
}
