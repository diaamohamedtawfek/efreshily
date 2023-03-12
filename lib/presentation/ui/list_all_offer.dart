import 'package:cached_network_image/cached_network_image.dart';
import 'package:efreshily/presentation/widgets/go.dart';
import 'package:efreshily/presentation/widgets/text_app.dart';
import 'package:flutter/material.dart';

import 'item/item.dart';

class ListAllOffers extends StatefulWidget {
  final double topSpace;
  final ScrollPhysics scrollPhysics;
  const ListAllOffers({Key? key, required this.topSpace, required this.scrollPhysics}) : super(key: key);

  @override
  State<ListAllOffers> createState() => _ListAllOffersState();
}

class _ListAllOffersState extends State<ListAllOffers> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: widget.scrollPhysics,
        padding: EdgeInsets.only(left: 15,right: 15,top: widget.topSpace,bottom: MediaQuery.of(context).padding.bottom+20),
        gridDelegate:  const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent:  190,
            // childAspectRatio: 3 / 2,
            mainAxisExtent: 260,
            crossAxisSpacing: 14,
            mainAxisSpacing: 20
        ),
        itemCount: 10,
        shrinkWrap: true,
        itemBuilder: (context,index){
          return SizedBox(
            height: 250,


            // * >>>>>>>>>>>>>>>>>>>>>>

            child: InkWell(
              onTap: () {
                Go.to(context: context, page: const Item());
              },
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                          Radius.circular(8)
                      ),
                      boxShadow: [BoxShadow(
                          color: Color(0x0d898989),
                          offset: Offset(0, 3),
                          blurRadius: 6,
                          spreadRadius: 0
                      )
                      ],
                      color: Color(0xfff9f9f9)
                  ),
                  child: Stack(
                    children: [


                      Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 0, right: 0, bottom: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment
                                .start,
                            children: [

                              Row(),


                              // * ------000>>>>>>> image
                              ClipRRect(
                                borderRadius: const BorderRadius
                                    .all(Radius.circular(10)),
                                child: Stack(
                                  children: [

                                    Container(
                                      height: 137.34381103515625,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      height: 137.34381103515625,

                                      width:   190,
                                      child: CachedNetworkImage(
                                        height: 137,
                                        // width:85,
                                        width:  190,
                                        fit: BoxFit.fill,
                                        imageUrl: "https://s3-media0.fl.yelpcdn.com/bphoto/IoANfH9JSA6OeL57iH5-wA/348s.jpg",
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

                                  ],
                                ),
                              ),


                              const SizedBox(height: 10,),

                              Padding(
                                padding: const EdgeInsets
                                    .only(
                                    left: 10, right: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment
                                      .start,
                                  children: [


                                    const TextApp(
                                      text: "Classic Chair Lorem ipsum is dummy cha ….",
                                      color: Color(0xff343241),
                                      fontWeight: FontWeight.w400,
                                      maxLines: 2,
                                      fontStyle:  FontStyle.normal,
                                      fontSize: 14.0,
                                      textAlign: TextAlign.start,

                                    ),

                                    const SizedBox(height: 9,),


                                    const TextApp(
                                      text:"1250 L.E",
                                      underLine: true,
                                      color:  Color(0xff8f9bb3),
                                      fontWeight: FontWeight.w300,
                                      fontStyle:  FontStyle.normal,
                                      fontSize: 12.0,
                                      textAlign: TextAlign
                                          .start,
                                    ),

                                    const SizedBox(height: 9,),


                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: const [

                                        TextApp(
                                          text:"1250 L.E",
                                          color:  Color(0xff000000),
                                          fontWeight: FontWeight.w700,
                                          fontStyle:  FontStyle.normal,
                                          fontSize: 16.0,
                                          textAlign: TextAlign
                                              .start,
                                        ),

                                        Icon(Icons.add_shopping_cart,size: 23,color: Color(0xfff7941d),)

                                      ],
                                    ),

                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),


                      Positioned(
                        right: 10,
                        top: 20,
                        child: InkWell(
                          onTap: () {},
                          child:  Center(
                            child:  Icon(Icons.favorite,
                              color:index==1?Colors.grey:const Color(0xfff7941d),
                              size: 25,
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),


          );
        });
  }
}
