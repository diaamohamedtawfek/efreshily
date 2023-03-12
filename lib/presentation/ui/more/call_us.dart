import 'package:efreshily/core/resources/colors_app.dart';
import 'package:efreshily/generated/l10n.dart';
import 'package:efreshily/presentation/widgets/app_bar_all.dart';
import 'package:efreshily/presentation/widgets/button_app.dart';
import 'package:efreshily/presentation/widgets/edit_text_border.dart';
import 'package:flutter/material.dart';

class CallUs extends StatefulWidget {
  const CallUs({Key? key}) : super(key: key);

  @override
  State<CallUs> createState() => _CallUsState();
}

class _CallUsState extends State<CallUs> {


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
                              Center(
                                child: Image.asset("assets/images/contact_us.png",height: 245,
                                  fit: BoxFit.fill,
                                  width: 240,
                                ),
                              )
                            ],
                          ),
                        ),




                        Padding(
                          padding: const EdgeInsets.only(left: 20,right: 20),
                          child: Column(
                            children:  [



                              const  SizedBox(height: 16,),
                              EditTextBorder(
                                onChanged: (e){},
                                numLine: 1,
                                // border: false,
                                enabled: true,
                                hintText: S.of(context).yourName,
                                labelText: S.of(context).yourName,
                                maxLine: 1,
                                obscureText: false,
                                textInputType: TextInputType.emailAddress,
                                validator: (e){
                                  return null;
                                },
                              ),



                              const  SizedBox(height: 16,),
                              EditTextBorder(
                                onChanged: (e){},
                                numLine: 1,
                                // border: false,
                                enabled: true,
                                hintText: S.of(context).name_street,
                                labelText: S.of(context).name_street,
                                maxLine: 1,
                                obscureText: false,
                                textInputType: TextInputType.emailAddress,
                                validator: (e){
                                  return null;

                                },
                              ),



                              const  SizedBox(height: 16,),
                              EditTextBorder(
                                onChanged: (e){},
                                numLine: 5,
                                // border: false,
                                enabled: true,
                                hintText: S.of(context).specialMarque,
                                labelText: S.of(context).specialMarque,
                                maxLine: 10,
                                obscureText: false,
                                textInputType: TextInputType.emailAddress,
                                validator: (e){
                                  return null;

                                },
                              ),



                              const SizedBox(height: 42,),
                              //
                              ButtonApps(
                                ontap: (){
                                  // if (_formKey.currentState!.validate()) {}
                                },
                                maxHeight: 50,
                                maxWidth: MediaQuery.of(context).size.width*.80,
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                colorBorder:primaryColor,
                                colorsText: whiteColor,
                                colorsButton: primaryColor,
                                textButton: S.of(context).send,
                              ),


                              const SizedBox(height: 36,),


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
