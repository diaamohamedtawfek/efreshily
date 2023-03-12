import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:efreshily/core/resources/colors_app.dart';
import 'package:efreshily/generated/l10n.dart';
import 'package:efreshily/presentation/ui/auth/login.dart';
import 'package:efreshily/presentation/ui/more/about_us.dart';
import 'package:efreshily/presentation/ui/more/call_us.dart';
import 'package:efreshily/presentation/ui/more/edit_profile.dart';
import 'package:efreshily/presentation/ui/more/favourite.dart';
import 'package:efreshily/presentation/widgets/app_bar_all.dart';
import 'package:efreshily/presentation/widgets/go.dart';
import 'package:efreshily/presentation/widgets/text_app.dart';
import 'package:flutter/material.dart';

class More extends StatefulWidget {
  const More({Key? key}) : super(key: key);

  @override
  State<More> createState() => _MoreState();
}

class _MoreState extends State<More> {

  var showLogin=[false,true];
  final _random = Random();

  @override
  Widget build(BuildContext context) {
    return
      showLogin[_random.nextInt(showLogin.length)]==true?
          const Login()
          :
      Scaffold(
      backgroundColor: scaffoldColor,
      appBar: AppBarAll(nameAppBar: S.of(context).more, showBack: false),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            Row(),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 210,
              color: Colors.white,
              padding: const EdgeInsets.only(left: 22,right: 22,bottom: 21),
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Container(
                          width: 107,
                          height: 108,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: const Color(0xfff7941d),
                                width: 3
                            ),
                            boxShadow: const [BoxShadow(
                                color: Color(0xfffdb813),
                                offset: Offset(0,3),
                                blurRadius: 6,
                                spreadRadius: 0
                            )],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(110),
                            child: CachedNetworkImage(
                              height: 155,//width:85,
                              fit: BoxFit.fill,
                              imageUrl:
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8Y8dzyfIyM7O2JMCab33SAuCY-Rk32CRguw&usqp=CAU",
                              placeholder: (context, url) =>const Center(child:
                              CircularProgressIndicator(),
                              ),
                              errorWidget: (context, url, error) => Center(
                                child: Image.asset("assets/images/logo.png",
                                  height: 85,width:85,
                                  fit: BoxFit.fill,),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 8,),


                        const TextApp(
                          text:"Diaa Mohamed",
                          color: Color(0xff4a4a4a),
                          maxLines: 1,
                          fontSize: 17,
                          textAlign: TextAlign.start,
                          fontWeight: FontWeight.w700,
                        ),

                        const SizedBox(height: 5,),


                        const TextApp(
                          text: "mdiaa7788@gmail.com",
                          color: Color(0xff4a4a4a),
                          maxLines: 3,
                          fontSize: 15,
                          textAlign: TextAlign.start,
                          fontWeight: FontWeight.w400,
                        ),


                      ],
                    ),

                    Positioned(
                        top: 10,
                        right: 10,
                        child:IconButton(
                          icon: const Icon(Icons.edit,size: 30),
                          onPressed: (){
                            Go.to(context: context, page: const EditProfile());
                          },
                        )
                      // SvgPicture.asset("assets/images/edit.svg",width: 20,height: 20,color: Colors.black,),
                    )
                  ],
                ),
              ),
            ),



            Padding(
              padding: const EdgeInsets.only(left: 22,right: 22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 35,),
                  designAction(name: S.of(context).favourite,widget: const Favourite()),

                  const SizedBox(height: 35,),
                  designAction(name: S.of(context).aboutUs,widget: const AboutUs()),

                  const SizedBox(height: 35,),
                  designAction(name: S.of(context).contact_us,widget: const CallUs()),

                  const SizedBox(height: 35,),
                  designAction(name: S.of(context).language,widget: null),

                  const SizedBox(height: 35,),
                  designAction(name: S.of(context).delete_your_account,widget: null,),

                  const SizedBox(height: 35,),
                  designAction(name: S.of(context).privacy_policy ,widget: null),

                  const SizedBox(height: 35,),
                  designAction(name: S.of(context).log_out ,widget: null,type: "logOut"),

                ],
              ),
            ),



          ],
        ),
      ),
    );
  }

  Widget designAction({required String name, Widget? widget,String? type}){
    return InkWell(
      onTap: (){
        if(widget != null){
          Go.to(context: context, page: widget);
        }else if(type=="logOut"){
          Go.toHomeAndRemmoveAllScreen(context: context, page: const Login());
        }
      },
      child: TextApp(
        text: name,
          color: const Color(0xff050505),
          fontWeight: FontWeight.w400,
          fontStyle:  FontStyle.normal,
          fontSize: 16.0
      ),
    );
  }
}
