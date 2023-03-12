import 'dart:async';

import 'package:efreshily/presentation/ui/onbording.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:efreshily/presentation/widgets/background_app.dart';

import '../../../core/resources/colors_app.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  getStringValuesSF() async {

    // await DefaultCacheManager().emptyCache();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool checkValue = prefs.containsKey('token');
    debugPrint("idUser=> "+checkValue.toString());

    Timer(
        const Duration(seconds: 3),
            () async {

            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (
                    // BuildContext context) => const IntroductionScreenApp()));
                    BuildContext context) => const OnBoardingScreen()));

        });


  }


  @override
  void initState() {
    super.initState();
    getStringValuesSF();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

         const BackGroundApp(),



         SizedBox(
           height: MediaQuery.of(context).size.height,
           width: MediaQuery.of(context).size.width,
           child:Center(
             // child:SvgPicture.asset("assets/images/logo.svg",height: 75,width: 284),
             child:Image.asset("assets/images/logo.png",width: 218,
                 height: 136,color: whiteColor,),
           ),
         )


        ],
      ),
    );
  }
}
