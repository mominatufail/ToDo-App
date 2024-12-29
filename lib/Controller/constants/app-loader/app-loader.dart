import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../app-colors/app-colors.dart';


class AppLoader extends StatelessWidget {
  const AppLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return SpinKitCircle(
      color: AppColors.primaryColor,
      //add color
    );
  }
}
