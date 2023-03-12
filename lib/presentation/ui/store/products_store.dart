import 'package:cached_network_image/cached_network_image.dart';
import 'package:efreshily/core/resources/colors_app.dart';
import 'package:efreshily/generated/l10n.dart';
import 'package:efreshily/presentation/ui/list_all_offer.dart';
import 'package:efreshily/presentation/widgets/app_bar_all.dart';
import 'package:efreshily/presentation/widgets/text_app.dart';
import 'package:flutter/material.dart';

class ProductsStore extends StatefulWidget {
  final String nameStore;
  const ProductsStore({Key? key, required this.nameStore}) : super(key: key);

  @override
  State<ProductsStore> createState() => _ProductsStoreState();
}

class _ProductsStoreState extends State<ProductsStore> {
  late ScrollController controller;
  @override
  void initState() {
    super.initState();
    controller = ScrollController()
      ..addListener(_scrollListener);
  }
  void _scrollListener() {
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: scaffoldColor,
        appBar: AppBarAll(nameAppBar:widget.nameStore, showBack: true),
        body: SafeArea(
          child: SingleChildScrollView(
            // padding: const EdgeInsets.only(left: 22,right: 22,top: 22),
            child: Column(
              children: [

                Padding(
                  padding: const EdgeInsets.only(left: 22,right: 22,top: 22),
                  child: Column(
                    children: [
                      listType(),
                      const SizedBox(height: 16,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextApp(
                            text: S.of(context).allProducts ,
                            color:const Color(0xff050505),
                            fontWeight: FontWeight.w400,
                            fontStyle:  FontStyle.normal,
                            fontSize: 16.0,
                            textAlign: TextAlign.start,
                          ),

                          const SizedBox(width: 3,),

                          TextApp(
                            text: "3589 "+S.of(context).products,
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
                    ],
                  ),
                ),





                const ListAllOffers(topSpace: 0, scrollPhysics:NeverScrollableScrollPhysics() ),
                // offers2(),
              ],
            ),
          ),
        )
    );
  }



  listType(){
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 92,
      child: ListView.builder(
        itemCount: 10,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
        return Container(
            width: 123,
            height: 89,
            decoration:  BoxDecoration(
                borderRadius:index!=0? const BorderRadius.all(
                    Radius.circular(5)
                ):null,
                border:index==0? const Border(
                  bottom: BorderSide( //                    <--- top side
                    color: Color(0xfff7941d),
                    width: 3.0,
                  )
                ):null,
                color: const Color(0xffffffff)
            ),
          margin: const EdgeInsetsDirectional.only(end: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 60,
                    height: 51,
                    child: CachedNetworkImage(
                      width: 60,
                      height: 51,
                      fit: BoxFit.fill,
                      imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDft0kEdYzlztS5H3VxVMihYg6RjfDkgrn7Q&usqp=CAU",
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
                  )
                ],
              ),

              const SizedBox(height: 5,),

              const Text(
                  "Chair",
                  style: TextStyle(
                      color:  Color(0xff000000),
                      fontWeight: FontWeight.w700,
                      fontFamily: "Roboto",
                      fontStyle:  FontStyle.normal,
                      fontSize: 14.0
                  ),
                  textAlign: TextAlign.right
              ),


            ],
          ),
        );
      }),
    );
  }

}









