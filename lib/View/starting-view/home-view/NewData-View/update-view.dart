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

class UpdateDataEntry extends StatefulWidget {
  final String docId; // Pass the document ID to this screen
  UpdateDataEntry({super.key, required this.docId});
  @override
  State<UpdateDataEntry> createState() => _UpdateDataEntryState();
}
class _UpdateDataEntryState extends State<UpdateDataEntry> {
  TextEditingController TitleController = TextEditingController();
  TextEditingController DescriptionController = TextEditingController();
  bool isloading = false;
  @override
  updatedata() async {
    try {
      isloading = true;
      setState(() {});
      User? user = FirebaseAuth.instance.currentUser;
      String userId = user!.uid;

      await FirebaseFirestore.instance.collection(userId).doc(widget.docId).update({
        'title': TitleController.text,
        'description': DescriptionController.text,
      });

      isloading = false;
      setState(() {});
      Navigator.pop(context);
    } catch (e) {
      isloading = false;
      setState(() {});
      Get.snackbar('Error', '${e.toString()}');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body:  Column(
        children: [
          ContainerClass(),
          SizedBox(height: 5),
          Image.asset('Assets/4th.jpg', height: 172, width: 243),
          SizedBox(height: 40),
          BlackTextHeading(text: 'Update Your Task'),
          SizedBox(height: 20),
          NormalTextWidget(
            text: 'Modify the details as per your choice',
            textColor: AppColors.primaryColor,
          ),
          SizedBox(height: 20),
          TextFormFieldWidget(
            hintText: 'Enter Name of your Task',
            controller: TitleController,
          ),
          SizedBox(height: 10),
          TextFormFieldWidget(
            hintText: 'Add Description',
            controller: DescriptionController,
          ),
          SizedBox(height: 20),
          isloading
              ? AppLoader()
              : ButtonWidget(
            text: 'Update Task',
            ontap: () {
              updatedata();
            },
          ),
        ],
      ),
    );
  }
}