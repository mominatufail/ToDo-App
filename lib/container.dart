import 'package:architecture/Controller/constants/app-colors/app-colors.dart';
import 'package:flutter/material.dart';

class ContainerClass extends StatelessWidget {
  const ContainerClass({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:

    //Row(mainAxisAlignment: MainAxisAlignment.start,
     // children: [
        Stack(
              children: [
            Container(
                height: 80, width: 140,
                decoration: BoxDecoration(
                    color: AppColors.primaryColor.withOpacity(0.8),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(200),
                      bottomRight: Radius.circular(200),))
            ),
            Container(
              height: 140,
              width: 80,
              decoration: BoxDecoration(
                color: AppColors.primaryColor.withOpacity(0.8),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(200),
                    bottomRight: Radius.circular(200)),
              ),),
                Padding(padding: const EdgeInsets.only(left: 18.0,top: 200),
                child:
                InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: ImageIcon(
                    AssetImage()
                  ),

                )
          ],),
   );
  }
}
