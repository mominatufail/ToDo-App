
  import 'package:flutter/cupertino.dart';

class ImageClass extends StatelessWidget {
  static String splashImg='assets/splashimg.jpg';
  String loginImg= 'assets/loginimg.jpg';
  //String girl3='assets/girl3.jpeg';
// String appLogoImg= 'assets/loginimg.png';
  String fiveimg= 'assets/5th.png';
  ImageClass({super.key, required this.loginImg});
  @override
  Widget build(BuildContext context) {
  return Image(image: AssetImage(splashImg),width: 400,);
  }
  }

