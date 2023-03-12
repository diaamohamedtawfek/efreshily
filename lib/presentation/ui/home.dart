import 'package:cached_network_image/cached_network_image.dart';
import 'package:efreshily/generated/l10n.dart';
import 'package:efreshily/presentation/ui/home/best_seller/best_seller.dart';
import 'package:efreshily/presentation/ui/home/new_added/new_added.dart';
import 'package:efreshily/presentation/ui/home/section_screen_home/slider_home.dart';
import 'package:efreshily/presentation/ui/home/section_screen_home/top_category_home.dart';
import 'package:efreshily/presentation/ui/home/section_screen_home/top_stores_home.dart';
import 'package:efreshily/presentation/widgets/text_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [

          Padding(
            padding: const EdgeInsets.only(left: 22,right: 22,bottom: 13,top: 12,),
            child:   Row(
              children: [
                Container(
                  width: 30,
                  height: 30,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                          Radius.circular(25)
                      ),
                      color: Color(0xfff7941d)
                  ),
                  child: Image.asset("assets/images/logo.png",color: Colors.white,),
                ),

                const SizedBox(width: 20,),

                Expanded(
                    child:Container(
                      padding: const EdgeInsets.only(left: 12,right: 12),
                        width: 289,
                        height: 35,
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                                Radius.circular(8)
                            ),
                            border: Border.all(
                                color: const Color(0xffb2b6be),
                                width: 1
                            )
                        ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //textSearch
                          TextApp(
                            text:S.of(context).textSearch,
                            color:   const Color(0xff949494),
                            fontWeight: FontWeight.w400,
                            fontStyle:  FontStyle.normal,
                            fontSize: 12.0,
                            textAlign: TextAlign
                                .start,
                          ),

                          SvgPicture.asset("assets/images/search.svg",color: Colors.black,height: 15,width: 15,)

                        ],
                      ),
                    ),
                ),
              ],
            ),
          ),

            const SliderHome(),

            const  SizedBox(height: 10,),
           const TopCategoryHome(),


            const  SizedBox(height: 0,),
            const TopStoresHome(),

            const  SizedBox(height: 0,),
            const NewAdded(),

            const  SizedBox(height: 20,),
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 130,
              decoration:const BoxDecoration(
                  borderRadius: BorderRadius.all(
                      Radius.circular(5)
                  ),
                  boxShadow: [BoxShadow(
                      color:  Color(0x29000000),
                      offset: Offset(0,3),
                      blurRadius: 6,
                      spreadRadius: 0
                  )]
              ),
              child:  CachedNetworkImage(
                height: 137,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fill,
                imageUrl: "https://bandhanbank.com/sites/default/files/2021-01/Offers-Landing_1226X538_2.jpg",
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
            ),),
            const  SizedBox(height: 20,),
            
            const BestSeller(),
            const  SizedBox(height: 40,),
          ],
        ),
      ),
    );
  }



}
