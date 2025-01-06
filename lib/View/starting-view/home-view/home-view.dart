import 'package:architecture/Controller/widgets/blacktext-heading-widget.dart';
import 'package:architecture/View/starting-view/home-view/NewData-View/newdata-entry.dart';
import 'package:architecture/View/starting-view/home-view/NewData-View/update-view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Controller/constants/app-colors/app-colors.dart';
import '../../../container.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body:  Column(
        children: [
          Stack(
              children:[Column(
                children: [
                  Container(
                    height: 200,
                    width:double.infinity,
                    child: Column(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(backgroundImage: AssetImage('Assets/profile.jpg'),radius: 50,),
                        SizedBox(height: 20,),
                        BlackTextHeading(text: 'Welcome Back!'),
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor.withOpacity(0.6),
                    ),
                  )],
              ),
                ContainerClass(),
              ]
          ),
          SizedBox(height: 8,),
          Image.asset('assets/5th.jpg',height: 246,width: 222,),
          Container(child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Column(
              children: [
                Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: [
                  BlackTextHeading(text: 'ToDo  Tasks'),IconButton(onPressed: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>NewDataEntry()));
                  }, icon:
                  Icon(Icons.add_circle,color: AppColors.blackColor,)),
                  // IconButton(onPressed: (){Navigator.push(context,
                  //     MaterialPageRoute(builder: (context)=>UpdateDataEntry(docId: 'docid')));},
                  //     icon: Icon(Icons.update_sharp,color: appColors.blackColor,))
                ],),Container(
                  height: 170,width: 310,decoration: BoxDecoration(borderRadius:
                BorderRadius.circular(30),color: Colors.grey[50]),
                  child: Expanded(child: StreamBuilder(stream: FirebaseFirestore.instance.collection(
                      FirebaseAuth.instance.currentUser!.uid).snapshots(),
                      builder:(BuildContext context,AsyncSnapshot<QuerySnapshot>snapshot){
                        final data = snapshot.data!.docs;
                        return ListView.builder (
                          itemCount:data.length,
                          itemBuilder:(context,index) {
                            return Card(
                              child: ListTile(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context)=>UpdateDataEntry(docId: data[index]['docid'])));
                                },
                                onLongPress: () {
                                  FirebaseFirestore.instance
                                      .collection(FirebaseAuth.instance.currentUser!.uid) // Use the current user's collection
                                      .doc(data[index]['docid']) // Target the specific document ID
                                      .delete()
                                      .then((_) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text("Task deleted successfully")),
                                    );
                                  })
                                      .catchError((error) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text("Failed to delete task: $error")),
                                    );
                                  });
                                },
                                title: Text(data[index]['description']),
                                subtitle: Text(data[index]['title']),
                              ),
                            );
                          },
                        );
                      }
                  )
                  ),)
              ],
            ),
          ),
            height: 226,width:326 ,decoration: BoxDecoration(color: AppColors.secondaryColor,
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ],
      ),
    );
  }
}