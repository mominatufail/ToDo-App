import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../Controller/constants/app-colors/app-colors.dart';
import '../../../../Controller/constants/app-loader/app-loader.dart';
import '../../../../Controller/widgets/blacktext-heading-widget.dart';
import '../../../../Controller/widgets/button-widget.dart';
import '../../../../Controller/widgets/normal-text-widget.dart';
import '../../../../Controller/widgets/textformfield-widget.dart';
import '../../../../container.dart';

class NewDataEntry extends StatefulWidget {
  NewDataEntry({super.key});
  @override
  State<NewDataEntry> createState() => _NewDataEntryState();
}
class _NewDataEntryState extends State<NewDataEntry> {
  TextEditingController TitleController= TextEditingController();
  TextEditingController DescriptionController= TextEditingController();
  bool isloading=false;
  insertdata()async{
    try{
      isloading=true;
      setState(() {
      });
      User? user=await FirebaseAuth.instance.currentUser;
      String userId=user!.uid;
      String docid=DateTime.now().microsecondsSinceEpoch.toString();
      await FirebaseFirestore.instance.collection(userId).doc(docid).set({
        'title': TitleController.text,
        'description': DescriptionController.text,
        'docid': docid,
        'userid': userId,
      });isloading=false;
      setState(() {
      });
      Navigator.pop(context);
    }
    catch(e){
      isloading=false;
      setState(() {

      });
      Get.snackbar('Error','${e.toString()}');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: AppColors.backGroundColor,
      body: Column(children: [ContainerClass(),SizedBox(height: 5,),
        Image.asset('Assets/4th.jpg',height: 170,width: 243,),
        SizedBox(height: 40,),
        BlackTextHeading(text: 'Add What You Want To Do Later On', ),
        SizedBox(height: 20,),
        NormalTextWidget(text: 'and Add description of your choice', textColor: AppColors.primaryColor),
        SizedBox(height: 20,),
        TextFormFieldWidget(hintText: 'Enter Name of your Task', controller:TitleController ),
        SizedBox(height: 10,),
        TextFormFieldWidget(hintText: 'Add Description', controller:DescriptionController ),
        SizedBox(height: 20,),
        isloading==true?AppLoader(): ButtonWidget(text: 'Add To List', ontap: (){ insertdata();
        }),
      ],
      ),
    );
  }
}