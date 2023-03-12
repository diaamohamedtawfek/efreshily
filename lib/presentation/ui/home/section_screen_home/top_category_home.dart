import 'package:efreshily/generated/l10n.dart';
import 'package:efreshily/presentation/ui/home/category/list_category_hor.dart';
import 'package:efreshily/presentation/widgets/go.dart';
import 'package:efreshily/presentation/widgets/text_app.dart';
import 'package:flutter/material.dart';

import '../category/category.dart';

class TopCategoryHome extends StatefulWidget {
  const TopCategoryHome({Key? key}) : super(key: key);

  @override
  State<TopCategoryHome> createState() => _TopCategoryHomeState();
}

class _TopCategoryHomeState extends State<TopCategoryHome> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(left: 16,right: 16),
      child:  Column(
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextApp(
                text: S
                    .of(context)
                    .top_category,
                color: const Color(0xff000000),
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                fontSize: 20.0,
                textAlign: TextAlign.start,
              ),

              const SizedBox(width: 3,),

              InkWell(
                onTap: (){
                  Go.to(context: context, page: const Category());
                },
                child: TextApp(
                  text: S
                      .of(context)
                      .seeMore,
                  color: const Color(0xfff7941d),
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 16.0,
                  maxLines: 3,
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),

          const SizedBox(height: 16,),

          SizedBox(
              height: 100,
              width: MediaQuery.of(context).size.width,
              child:const ListCategoryHor()
          ),
        ],
      ),
    );
  }
}
