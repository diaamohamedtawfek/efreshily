import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:efreshily/core/resources/colors_app.dart';
import 'package:efreshily/generated/l10n.dart';
import 'package:efreshily/presentation/ui/item/slider_home.dart';
import 'package:efreshily/presentation/widgets/app_bar_all.dart';
import 'package:efreshily/presentation/widgets/go.dart';
import 'package:efreshily/presentation/widgets/text_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Item extends StatefulWidget {
  const Item({Key? key}) : super(key: key);

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:scaffoldColor,
        appBar: AppBarAll(nameAppBar: S.of(context).product_details, showBack: true),
        body:Directionality(
          textDirection: TextDirection.ltr,
          child:  SizedBox(
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: Stack(
              children:  [
            SizedBox(height: MediaQuery.of(context).size.height,),
                // *  SliderItem
                const SliderHome(),

                Positioned(
                  top: 20,
                  right: 28,
                  child:shareItem(),
                ),


                Positioned(
                  top: 240,
                  left: 16,
                  child:desItem(),
                ),


              ],
            ),
          ),
        )
        )
    );
  }

  Widget shareItem(){
    return SizedBox(
      width: 50,
      child: Column(
        children: [
          Container(
            width: 40,
            height: 40,
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                    Radius.circular(5)
                ),
                boxShadow: [BoxShadow(
                    color: Color(0x29000000),
                    offset: Offset(0,3),
                    blurRadius: 6,
                    spreadRadius: 0
                )] ,
                color: Color(0xffffffff)
            ),
            child: SvgPicture.asset("assets/images/fav.svg",height: 20,width: 20,),
          ),


          const SizedBox(height: 17,),
          Container(
            width: 40,
            height: 40,
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                    Radius.circular(5)
                ),
                boxShadow: [BoxShadow(
                    color: Color(0x29000000),
                    offset: Offset(0,3),
                    blurRadius: 6,
                    spreadRadius: 0
                )] ,
                color: Color(0xffffffff)
            ),
            child: SvgPicture.asset("assets/images/share.svg",height: 20,width: 20,),
          ),

        ],
      ),
    );
  }


  Widget desItem(){
    return  Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(right: 36),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [


          Container(
            width: 67,
            height: 29,
            padding: const EdgeInsets.only(left: 7,right: 7),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                    Radius.circular(5)
                ),
                color: Color(0xffffe3c2)
            ),
            child: const Center(
              child: TextApp(
                text: "Ikea",
                color:  Color(0xff797979),
                fontWeight: FontWeight.w400,
                fontStyle:  FontStyle.normal,
                maxLines: 1,
                fontSize: 18.0,
                textAlign: TextAlign.start,

              ),
            ),
          ),

          const SizedBox(height: 17,),

          const TextApp(
            text: "Classic Chair Lorem ipsum, Classic Chair Lorem ipsum is dummy cha ….  ",
            color: Color(0xff343241),
            fontWeight: FontWeight.w400,
            maxLines: 13,
            fontStyle:  FontStyle.normal,
            fontSize: 18.0,
            textAlign: TextAlign.start,
          ),


          const SizedBox(height: 10,),

          const TextApp(
            text: "9,587 L.E",
            color:  Color(0xff000000),
            fontWeight: FontWeight.w700,
            fontStyle:  FontStyle.normal,
            fontSize: 24.0,
            textAlign: TextAlign.start,
          ),


          const SizedBox(height: 16,),

          // listColor(),

          listCategory(),



          const SizedBox(height: 16,),

          typeInfoStore(),

        ],
      ),
    );
  }


  final _random = Random();
  listColor(){
    return Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.only(right: 36),
        height: 96,
        padding: const EdgeInsets.all(16),
        decoration:const BoxDecoration(
            borderRadius: BorderRadius.all(
                Radius.circular(5)
            ),
            color:  Color(0xffffffff)
        ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const TextApp(
            text: "Color",
            color: Color(0xff000000),
            fontWeight: FontWeight.w700,
            fontStyle:  FontStyle.normal,
            fontSize: 18.0,
            textAlign: TextAlign.start,
          ),

          const SizedBox(height: 16,),

          SizedBox(
            height: 25,
            child: ListView.builder(
            itemCount: 25,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
            return Container(
                width: 25,
                height: 25,
                margin: const EdgeInsetsDirectional.only(end: 16),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                        Radius.circular(5)
                    ),
                    border: Border.all(
                        color: Colors.grey.withOpacity(.5),
                        width: 1
                    ),
                  color: Colors.primaries[_random.nextInt(Colors.primaries.length)]
                  [_random.nextInt(9) * 100],
                )
            );
          }),
          )

        ],
      ),
    );
  }



  listCategory(){
    return Container(
      // color:  const Color(0xffffffff),
      padding: const EdgeInsets.only(left: 12,right: 12,top: 7),
      margin: const EdgeInsets.only(right: 36),
      decoration:const BoxDecoration(
          borderRadius: BorderRadius.all(
              Radius.circular(5)
          ),
          color:  Color(0xffffffff)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

         TextApp(
                    text: S.of(context).similar_products,
                    color:const Color(0xff000000),
                    fontWeight: FontWeight.w700,
                    fontStyle:  FontStyle.normal,
                    fontSize: 18.0,
                    textAlign: TextAlign.start,
                  ),

          const SizedBox(height: 8,),

          Container(
            // width: MediaQuery.of(context).size.width-22,
            // margin: const EdgeInsets.only(right: 36),
            padding: const EdgeInsets.only(left: 0,right: 0,top: 5,bottom: 5),
            height: 80,
            // padding: const EdgeInsets.all(16),
            decoration:const BoxDecoration(
                borderRadius: BorderRadius.all(
                    Radius.circular(5)
                ),
                color:  Color(0xffffffff)
            ),
            child:ListView.builder(
                physics: const ScrollPhysics(),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context,index){
                  return Container(
                    margin: const EdgeInsetsDirectional.only(end: 5),
                    child: InkWell(
                      onTap: () {
                        Go.toReplacement(context: context, page: const Item());
                      },
                      child:Container(
                        height: 75,
                        width: 70,
                        decoration:  BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.primaries[_random.nextInt(Colors.primaries.length)]
                          [_random.nextInt(9) * 100],
                        ),
                        child: Stack(
                          children: [

                            ClipRRect(
                              borderRadius: const BorderRadius.all(Radius.circular(100)),
                              child: CachedNetworkImage(
                                height: 75,
                                width: 75,
                                fit: BoxFit.fill,
                                imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRaN4hIZRMFk8MPGm_tp-wV2D22MI7nMs6Yug&usqp=CAU",
                                placeholder: (context,
                                    url) =>
                                const Center(child:
                                CircularProgressIndicator()
                                  ,),
                                errorWidget: (context,
                                    url, error) =>
                                    Center(
                                      child: Image
                                          .asset(
                                        "assets/images/logo.png",
                                        height: 85,
                                        width: 85,
                                        fit: BoxFit
                                            .fill,
                                      ),
                                    ),
                              ),
                            ),


                            if(false==true)
                            Container(
                              height: 80,
                              width: 80,
                              padding: const EdgeInsets.only(top: 0),
                              decoration:  BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey.withOpacity(.25),
                              ),

                              child: const Center(
                                child:  Text(
                                  "Bed Room",
                                  style: TextStyle(
                                      color:  Color(0xffffffff),
                                      fontWeight: FontWeight.w700,
                                      fontFamily: "Roboto",
                                      fontStyle:  FontStyle.normal,
                                      fontSize: 12.0
                                  ),
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }


  int type=0;
  Widget typeInfoStore(){
    return Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(right: 36),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
                Radius.circular(5)
            ),
            color: Color(0xffffffff)
        ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children:  [

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              InkWell(
                onTap: (){
                  setState(() {
                    type=0;
                  });
                },
                child:  Container(
                    width: 121,
                    height: 40,
                    decoration:  BoxDecoration(
                        borderRadius:const BorderRadius.all(
                            Radius.circular(5)
                        ),
                        color: type==0?const Color(0xfff7941d):Colors.transparent
                    ),
                  child:Center(
                    child:  TextApp(
                      text: S.of(context).description,
                      color:type==0?const Color(0xffffffff):const Color(0xffaaaaaa),
                      fontWeight: FontWeight.w700,
                      fontStyle:  FontStyle.normal,
                      fontSize: 18.0,
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
              ),

              InkWell(
                onTap: (){
                  setState(() {
                    type=1;
                  });
                },
                child:  Container(
                    width: 121,
                    height: 40,
                    decoration:  BoxDecoration(
                        borderRadius:const BorderRadius.all(
                            Radius.circular(5)
                        ),
                        color: type==1?const Color(0xfff7941d):Colors.transparent
                    ),
                  child:Center(
                    child:  TextApp(
                      text: S.of(context).store_info,
                      color:type==1?const Color(0xffffffff):const Color(0xffaaaaaa),
                      fontWeight: FontWeight.w700,
                      fontStyle:  FontStyle.normal,
                      fontSize: 18.0,
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
              ),



            ],
          ),
          const Divider(thickness: 1,),

          if(type==0)...[
            const SizedBox(height: 6,),
            const Text(
                "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed ",
                style: TextStyle(
                    color:  Color(0xff050505),
                    fontWeight: FontWeight.w400,
                    fontFamily: "SFProDisplay",
                    fontStyle:  FontStyle.normal,
                    fontSize: 16.0
                ),
                textAlign: TextAlign.left
            ),

          ]else if(type==1)...[
// Length without side shelf: 180 cm

            textStoreInf(des: "Homz Wood1",name: S.of(context).brand),
            textStoreInf(des: "Light Brown & BLack",name: S.of(context).color),
            textStoreInf(des: "MDF and Melamine.",name: S.of(context).material),

            textStoreInf(des: "250 cm",name: S.of(context).length),
            textStoreInf(des: "40 cm",name: S.of(context).width),
            textStoreInf(des: "40 cm",name: S.of(context).height),

            textStoreInf(des: "250 cm",name: S.of(context).length_with_side_shelf),
            textStoreInf(des: "180 cm",name: S.of(context).length_without_side_shelf),
          ]
        ],
      ),
    );
  }

  textStoreInf({name, des}){
    return Row(
      children: [
        TextApp(
          text: name,
          color:const Color(0xff050505),
          fontWeight: FontWeight.w400,
          fontStyle:  FontStyle.normal,
          fontSize: 16.0,
          textAlign: TextAlign.start,
        ),

        const SizedBox(width: 3,),

        TextApp(
          text: des,
          color:const Color(0xff050505),
          fontWeight: FontWeight.w400,
          fontStyle:  FontStyle.normal,
          fontSize: 16.0,
          maxLines: 3,
          textAlign: TextAlign.start,
        ),
      ],
    );
  }
}
