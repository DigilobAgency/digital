import 'dart:async';

import 'package:assignment_1/custom_image_view.dart';
import 'package:assignment_1/main.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
     body: Column(
       mainAxisAlignment: MainAxisAlignment.center,
       children: [
         Center(child: CustomImageView(imagePath: "assets/images/logo.png", width: 200.0,))
       ],
     ),
    );
  }

  @override
  void initState() {
    super.initState();

    Timer( const Duration(seconds: 3), () {
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
          const DashboardView()), (Route<dynamic> route) => false);
      print("called");
     
    });
  }
}
