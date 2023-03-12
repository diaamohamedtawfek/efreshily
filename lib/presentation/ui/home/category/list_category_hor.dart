import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:efreshily/presentation/ui/home/category/products_category.dart';
import 'package:efreshily/presentation/widgets/go.dart';
import 'package:flutter/material.dart';

class ListCategoryHor extends StatefulWidget {
  const ListCategoryHor({Key? key}) : super(key: key);

  @override
  State<ListCategoryHor> createState() => _ListCategoryHorState();
}

class _ListCategoryHorState extends State<ListCategoryHor> {
  final _random = Random();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const ScrollPhysics(),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom+20),
        itemCount: 10,
        itemBuilder: (context,index){
          return Container(
            margin: const EdgeInsetsDirectional.only(end: 15),
            child: InkWell(
              onTap: () {
                Go.to(context: context, page: const ProductsCategory());
              },
              child:Container(
                height: 80,
                width: 80,
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
                        height: 80,
                        width: 80,
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


                    Container(
                      height: 80,
                      width: 80,
                      padding: const EdgeInsets.only(top: 15),
                      decoration:  BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey.withOpacity(.25),
                      ),

                      child: const Text(
                            "Bed Room",
                            style: TextStyle(
                                color:  Color(0xffffffff),
                                fontWeight: FontWeight.w400,
                                fontFamily: "Roboto",
                                fontStyle:  FontStyle.normal,
                                fontSize: 10.0
                            ),
                            textAlign: TextAlign.center,
                          maxLines: 2,
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
