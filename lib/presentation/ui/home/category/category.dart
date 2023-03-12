import 'package:efreshily/core/resources/colors_app.dart';
import 'package:efreshily/generated/l10n.dart';
import 'package:efreshily/presentation/ui/home/category/list_catig.dart';
import 'package:efreshily/presentation/widgets/app_bar_all.dart';
import 'package:efreshily/presentation/widgets/text_app.dart';
import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  const Category({Key? key}) : super(key: key);

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: scaffoldColor,
        appBar: AppBarAll(nameAppBar: S
            .of(context)
            .category, showBack: true),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(left: 22,right: 22,top: 22),
            child: Column(
              children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextApp(
                      text: S.of(context).top_category ,
                      color:const Color(0xff050505),
                      fontWeight: FontWeight.w400,
                      fontStyle:  FontStyle.normal,
                      fontSize: 16.0,
                      textAlign: TextAlign.start,
                    ),

                    const SizedBox(width: 3,),

                    TextApp(
                      text: "35  "+S.of(context).category,
                      color:const Color(0xffa0a0a0),
                      fontWeight: FontWeight.w400,
                      fontStyle:  FontStyle.normal,
                      fontSize: 12.0,
                      maxLines: 3,
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),

                const SizedBox(height: 16,),

                const ListCatig(),
              ],
            ),
          ),
        )
    );
  }

}
