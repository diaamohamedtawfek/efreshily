import 'package:efreshily/core/resources/colors_app.dart';
import 'package:efreshily/presentation/ui/search/search_by_item.dart';
import 'package:efreshily/presentation/ui/search/show_rooms.dart';
import 'package:efreshily/presentation/widgets/app_bar_all.dart';
import 'package:efreshily/presentation/widgets/go.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../generated/l10n.dart';
import '../../widgets/text_app.dart';
import '../home/section_screen_home/slider_home.dart';


class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          backgroundColor: scaffoldColor,
          appBar: AppBarAll(nameAppBar: S
              .of(context)
              .title, showBack: false),
          body: SafeArea(
    child:SingleChildScrollView(
        child: Column(
          children: [


            const SliderHome(),


          InkWell(
             onTap: (){
               Go.to(context: context, page: const SearchByItem());
             },
            child: Container(
              padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height*.1),
              child: Column(
                children: [

                  Container(
                    height: 80,
                    width: 170,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color(0xfff79825),
                    ),
                    child: const Center(
                      child: TextApp(
                        text: "Search By Item",
                        color: whiteColor,
                        maxLines: 1,
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
          // InkWell()


            InkWell(
                onTap: (){
                  Go.to(context: context, page: const ShowRooms());
                },
                child:
          Container(
            padding: const EdgeInsets.only(top: 40),
            child: Column(
              children: [

                Container(
                  height: 80,
                  width: 170,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color(0xfff79825),
                  ),
                  child: const Center(
                    child: TextApp(
                      text: "Show Rooms",
                      color: whiteColor,
                      maxLines: 1,
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                ),

              ],
            ),
            )),


          ],
        ),
      )),
    );
  }
}
