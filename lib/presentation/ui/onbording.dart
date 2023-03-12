import 'dart:io';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:efreshily/core/resources/colors_app.dart';
import 'package:efreshily/presentation/ui/home.dart';
import 'package:efreshily/presentation/ui/home/category/category.dart';
import 'package:efreshily/presentation/ui/more/more.dart';
import 'package:efreshily/presentation/ui/search/search.dart';
import 'package:efreshily/presentation/ui/store/storre.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/plugin/motion_tab_bar.dart';



class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {

  late PageController pageController= PageController(initialPage: 2);
  int selectedIndex=2;
  var pages=[
    const Search(),
    const Store(),
    const Home(),
    const Category(),
    const More(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton:Container(
            width: 65,
            height: 65,
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
                boxShadow: [BoxShadow(
                    color: Color(0xfffdb813),
                    offset:  Offset(0,3),
                    blurRadius: 6,
                    spreadRadius: 0
                )] ,
                color: Color(0xfff79825),
            ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Icon(Icons.call,color: whiteColor,),
              Text(
                  "Call Engineer",
                  style: TextStyle(
                      color:  Color(0xffffffff),
                      fontWeight: FontWeight.w700,
                      fontFamily: "Roboto",
                      fontStyle:  FontStyle.normal,
                      fontSize: 8.0
                  ),
                  textAlign: TextAlign.center,
                maxLines: 1,
              ),
            ],
          ),
        ),
      // * ---------------------   body
      body:
      SafeArea(
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          children: pages,
        ),
      ),


      // * ---------------------   bottomNavigationBar

      bottomNavigationBar:
      ConvexAppBar(
        items: [

          TabItem(
            icon:SvgPicture.asset("assets/images/search.svg",width: 30,height: 30,fit: BoxFit.fitHeight,color: Colors.black,),
            activeIcon:SvgPicture.asset("assets/images/search.svg",width: 30,height: 30,fit: BoxFit.none,color: Colors.white,),
          ),

          const TabItem(
            icon:Icon(Icons.whatsapp,size: 20,color: Colors.black),
            activeIcon:Icon(Icons.whatsapp,size: 25,color: Colors.white),
          ),

          TabItem(
            icon:SvgPicture.asset("assets/images/home4.svg",width: 30,height: 30,fit: BoxFit.fitHeight,color: Colors.black),
            activeIcon:SvgPicture.asset("assets/images/home4.svg",width: 30,height: 30,fit: BoxFit.none,color: Colors.white),
          ),

          TabItem(
            icon:SvgPicture.asset("assets/images/store.svg",width: 20,height: 20,fit: BoxFit.none),
            activeIcon:SvgPicture.asset("assets/images/store.svg",width: 30,height: 30,fit: BoxFit.none),
          ),

          TabItem(
            icon:SvgPicture.asset("assets/images/profile.svg",width: 30,height: 30,fit: BoxFit.fitHeight,color: Colors.black),
            activeIcon:SvgPicture.asset("assets/images/profile.svg",width: 30,height: 30,fit: BoxFit.none,color: Colors.white),
          ),
        ],
        // color: whiteColor,
        color: Colors.grey,
        height: 35,
        activeColor:const Color(0xfff79825) ,
        backgroundColor: whiteColor,
        initialActiveIndex: selectedIndex,//optional, default as 0
        onTap: (int i){
          if(i==1){

            sendMass();
          }else{
    setState(() {
              selectedIndex=i;
              pageController.animateToPage(selectedIndex,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeOutQuad);
              // _tabController!.index = value;
            });
        }
        },
      )
      // Container(
      //   color: Colors.white,
      //   height:Platform.isIOS?55+MediaQuery.of(context).padding.bottom: 55+MediaQuery.of(context).padding.bottom,
      //   child: Align(
      //     alignment:Alignment.topRight ,
      //     child:  MotionTabBar(
      //       initialSelectedTab: S.of(context).home,
      //       useSafeArea: true, // default: true, apply safe area wrapper
      //       labels: [(S.of(context).home),(S.of(context).category),(S.of(context).stores), (S.of(context).more)],
      //       icons: const ['assets/images/home4.svg', 'assets/images/cat.svg', 'assets/images/store.svg',
      //         'assets/images/more1.svg'],
      //       // icons: const [Icons.home, Icons.home, Icons.people_alt, Icons.settings],
      //       badges: const [
      //         null,
      //         null,
      //         null,
      //         null,
      //       ],
      //       tabSize: 50,
      //       tabBarHeight: 55,
      //       textStyle: const TextStyle(
      //         fontSize: 12,
      //         color: Colors.black,
      //         fontWeight: FontWeight.w500,
      //       ),
      //       tabIconColor: const Color(0xff5d5d5d),
      //       tabIconSize: 18.0,
      //       tabIconSelectedSize: 18.0,
      //       tabSelectedColor: const Color(0xfff7941d),
      //       tabIconSelectedColor: Colors.white,
      //       tabBarColor: const Color(0xffffffff),
      //       onTabItemSelected: (int value) {
      //         setState(() {
      //           selectedIndex=value;
      //           pageController.animateToPage(selectedIndex,
      //               duration: const Duration(milliseconds: 400),
      //               curve: Curves.easeOutQuad);
      //           // _tabController!.index = value;
      //         });
      //       },
      //     )
      //
      //   ),
      // ) ,
    );
  }

  sendMass()async{
    await canLaunch(
        'https://api.whatsapp.com/send?phone=00968 255 255 555&text=')
        ? await launch(
        'https://api.whatsapp.com/send?phone=00968 255 255 555&text=')
        : throw 'Could not launch WhatsApp';
  }
}
