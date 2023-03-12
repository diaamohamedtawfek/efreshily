// ignore_for_file: prefer_typing_uninitialized_variables, empty_catches, duplicate_ignore

import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:loop_page_view/loop_page_view.dart';

class SliderHome extends StatefulWidget{
  const SliderHome({Key? key,}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return UiSliderHome();
  }
}

class UiSliderHome extends State<SliderHome> {
  LoopPageController controllerLoopPageController = LoopPageController();
  final controller = PageController(initialPage: 0);
  Timer? timer;
  int _currentPage = 0;

  addDataIntoSlider() {
    timer = Timer.periodic(const Duration(seconds: 2), (Timer timer) {
        if (_currentPage < 4)
          {
              _currentPage++;
              try{
                setState(() {});
              }catch(_){}
      }
        else {
            _currentPage = 0;
            try{
              setState(() {});
            }catch(r){}
      }
      try {
        controllerLoopPageController.animateToPage(
          _currentPage,
          duration:const Duration(milliseconds: 700),
          curve: Curves.easeIn,
        );
        controller.animateToPage(
          _currentPage,
          duration:const Duration(milliseconds: 700),
          curve: Curves.easeIn,
        );
      } catch (_) {}
    });
  }



  @override
  void initState() {
    super.initState();
    addDataIntoSlider();
  }
  @override
  void dispose() {
    try{
      timer!.cancel();
    }catch(e){}
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return bodyScreen();
  }





  bodyScreen(){
    return
      SizedBox(
      height: 260,
      child:
      Stack(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: SizedBox(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                height:260,
                child: Stack(
                  children: [
                    Positioned(child:
                    Align(
                      alignment: Alignment.center,
                      child:
                      LoopPageView.builder(
                        controller: controllerLoopPageController,
                        itemCount: 5,
                        pageSnapping: true,
                        allowImplicitScrolling: true,
                        onPageChanged: (e){
                        },
                        itemBuilder: (_, index) {
                          return  Container(
                              padding:const EdgeInsets.only(left: 0,right: 0,),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(0),
                                child:InkWell(
                                  onTap: (){},
                                  child: CachedNetworkImage(
                                    // height: 107,
                                    // width:107,
                                    fit: BoxFit.fill,
                                    imageUrl:
                                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRaN4hIZRMFk8MPGm_tp-wV2D22MI7nMs6Yug&usqp=CAU",
                                    placeholder: (context, url) =>const Center(child:CircularProgressIndicator() ),
                                    errorWidget: (context, url, error) => Image.asset("assets/images/background.png",
                                      fit: BoxFit.fill),
                                  ),
                                ),
                            ),
                          );
                        },
                      )
                    ),),
                  ],
                )),
            width: MediaQuery
                .of(context)
                .size
                .width,
          ),


          Align(
            alignment: Alignment.bottomCenter,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                SizedBox(height: 20,
                    child: ListView.builder(
                      itemCount: 5,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                   return Center(
                     child:
                     Container(
                       margin: const EdgeInsetsDirectional.only(end: 4),
                       width: 16,
                       height: 16,
                       padding: const EdgeInsets.all(3),
                       decoration: BoxDecoration(
                           shape: BoxShape.circle,
                           border: Border.all(
                               color: const Color(0xffffffff),
                               width: 1
                           )
                       ),
                       child:  Visibility(
                        visible: _currentPage!=index ? false : true,
                        child: AnimatedOpacity(
                          curve: Curves.slowMiddle,
                        duration: const Duration(milliseconds: 700),
                        opacity: _currentPage!=index ? 0 : 1,
                        child:Container(
                           decoration: const BoxDecoration(
                               shape: BoxShape.circle,
                               color: Color(0xfff7941d)
                           )
                       ),
                       ),
                       ),
                     ),
                   );
                  })),
                  const SizedBox(height: 20,),
                ],
              ),
          ),

        ],
      ),
    );
  }
}