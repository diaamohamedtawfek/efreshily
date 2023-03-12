
import 'package:cached_network_image/cached_network_image.dart';
import 'package:efreshily/core/resources/colors_app.dart';
import 'package:efreshily/presentation/ui/store/products_store.dart';
import 'package:efreshily/presentation/widgets/app_bar_all.dart';
import 'package:efreshily/presentation/widgets/edit_text.dart';
import 'package:efreshily/presentation/widgets/go.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../generated/l10n.dart';
import '../../widgets/text_app.dart';
import '../home/section_screen_home/slider_home.dart';

class ShowRooms extends StatefulWidget {
  const ShowRooms({Key? key}) : super(key: key);

  @override
  State<ShowRooms> createState() => _ShowRoomsState();
}

class _ShowRoomsState extends State<ShowRooms> {

  TextEditingController showRoomsController = TextEditingController();//..text="1023170331";


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          backgroundColor: scaffoldColor,
          appBar: AppBarAll(nameAppBar: S
              .of(context)
              .title, showBack: true),
          body: SafeArea(
    child:Column(
      children: [

        Padding(
          padding: const EdgeInsets.only(left: 12,right: 12,top: 20,bottom: 8),
          child: TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            enabled: true,
            minLines: 1 ,
            maxLines:1,
            obscureText: true,
            onChanged: (onChanged){},
            validator:  (validator){},
            controller: showRoomsController,
            cursorColor:const Color(0xff212660),

            onEditingComplete: () => FocusScope.of(context).nextFocus(),
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelText:  "Search",
              hintText:  "Search",

              fillColor: const Color(0xffFFFFFF).withOpacity(.133),
              filled: true,

              contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              disabledBorder:
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(
                  color: Color(0x29000000),
                ),
              ),

              enabledBorder:
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(
                  color:Color(0x29000000),
                ),
              ),
              focusedBorder:
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(
                  color: Color(0x29000000),
                ),
              ),

              border:
              const OutlineInputBorder(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)
                ),
              ),


              labelStyle:  const TextStyle(
                fontFamily: 'Poppins',
                color:Colors.grey,
                fontSize: 15,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              ),
              hintStyle: const TextStyle(
                color:Colors.grey,
                fontSize: 16.0,
                fontWeight: FontWeight.w300,
                fontStyle: FontStyle.normal,
              ),
            ),
            style: const TextStyle(
              fontFamily: 'Poppins',
              color:Color(0xff000000),
              fontSize: 16,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
            ),


          ),
        ),

        Expanded(child:   ListView.builder(
            physics: const ScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom+20,left: 12,right: 12),
            itemCount: 10,
            itemBuilder: (context,index){
              return InkWell(
                onTap: () {
                },
                child: Card(
                  elevation: 5,
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
                    child:Column(
                      children: [

                        ClipRRect(
                          borderRadius: const BorderRadius.all(Radius.circular(5)),
                          child: CachedNetworkImage(
                            height: 165,
                            width: MediaQuery.of(context).size.width,
                            fit: BoxFit.fill,
                            imageUrl: "https://www.loginbrands.com/images/Article/101553-Versace-Furniture-Brand-1.jpg",
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

                        const SizedBox(height: 15,),

                        TextApp(
                          text: "Show Rooms",
                          color: primaryColor,
                          maxLines: 1,
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),

                        const SizedBox(height: 15,),
                      ],
                    ),
                  ),
                ),
              );
            }))
      ],
    )
      ),
    );
  }
}
