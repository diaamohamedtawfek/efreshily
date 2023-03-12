
import 'package:cached_network_image/cached_network_image.dart';
import 'package:efreshily/core/resources/colors_app.dart';
import 'package:efreshily/presentation/widgets/app_bar_all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../generated/l10n.dart';
import '../../widgets/text_app.dart';
import '../home/section_screen_home/slider_home.dart';

class SearchByItem extends StatefulWidget {
  const SearchByItem({Key? key}) : super(key: key);

  @override
  State<SearchByItem> createState() => _SearchByItemState();
}

class _SearchByItemState extends State<SearchByItem> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          backgroundColor: scaffoldColor,
          appBar: AppBarAll(nameAppBar: S
              .of(context)
              .title, showBack: true),
          body: SafeArea(
    child:ListView.builder(
              physics: const ScrollPhysics(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              padding: EdgeInsets.only(bottom: MediaQuery
                  .of(context)
                  .padding
                  .bottom + 20,left: 12,right: 12),
              itemCount: 10,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    // Go.to(context: context, page: const ProductsCategory());
                  },
                  child: Card(
                    margin: const EdgeInsets.only(bottom: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
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
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(
                            Radius.circular(5)),
                        child: CachedNetworkImage(
                          height: 200,
                          fit: BoxFit.fill,
                          imageUrl: "https://www.homestratosphere.com/wp-content/uploads/2017/11/FURNITURES-1.jpg",
                          // "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS7iURWVLdWCBhhA9Grj499C6WE5zjyHkE-Xw&usqp=CAU",
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
                    ),
                  ),
                );
              })
      ),
    );
  }
}
