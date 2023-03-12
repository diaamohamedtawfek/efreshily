import 'package:efreshily/core/resources/colors_app.dart';
import 'package:efreshily/generated/l10n.dart';
import 'package:efreshily/presentation/widgets/app_bar_all.dart';
import 'package:efreshily/presentation/widgets/text_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {


  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldColor,
      appBar: AppBarAll(nameAppBar: S.of(context).aboutUs, showBack: true),
      body: Stack(
        children: [
          SafeArea(
              child: Form(
                  key: _formKey,
                  child:SingleChildScrollView(
                    child: Column(
                      children: [

                        Row(),
                        SizedBox(
                          height: 220,
                          width: MediaQuery.of(context).size.width,
                          child: Stack(
                            children: [

                              SvgPicture.asset("assets/images/aboutUs.svg",//height: 165,
                                fit: BoxFit.cover,
                                width: MediaQuery.of(context).size.width,
                              ),
                            ],
                          ),
                        ),




                        Padding(
                          padding:  EdgeInsets.only(left: 12,right: 12,bottom: MediaQuery.of(context).padding.bottom),
                          child: Column(
                            children:  [



                              const  SizedBox(height: 16,),

                              TextApp(
                                text: "Efreshly is a pioneer application in Egypt and the middle east which gives you a wide variety in choosing everything your house needs. Without moving from your house get to know the latest trends and ideas in decorating and furnishing your new home. We will show you how to renew and restyle your old furniture. A special discount and offers exclusive for Efreshly application only. Efreshly brings all the latest collection of furniture and home decorations stores to your own mobile. With one touch of a button find all the furniture stores located in Egypt. A direct live contact with one of the best interior desginers , decorators to help you choose and design your house. A well expert organized division and section for all the categories of products to make it easier on you to find what you need. An international shipping service if you're living aboard. Efreshly application is dedicated to smart living needs, It's an innovation meet future. Create , Update , Renovate Efreshly is the answer. Innovation ideas , stylish designs under just one click of a button. Efreshly is transforming thoughts and ideas into reality.",
                                  color:  const Color(0xff000000).withOpacity(.7),
                                  fontWeight: FontWeight.w300,
                                  maxLines: 11111,
                                  textAlign: TextAlign.start,
                                  fontStyle:  FontStyle.normal,
                                  fontSize: 16.0
                              )

                            ],
                          ),
                        )




                      ],
                    ),
                  )
          ),
          )
        ],
      ),
    );
  }

}
