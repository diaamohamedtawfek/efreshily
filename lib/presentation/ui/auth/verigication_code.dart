import 'dart:async';

import 'package:efreshily/presentation/ui/auth/change_password.dart';
import 'package:efreshily/presentation/widgets/app_bar_all.dart';
import 'package:flutter/material.dart';
import 'package:efreshily/core/resources/colors_app.dart';
import 'package:efreshily/generated/l10n.dart';
import 'package:efreshily/presentation/widgets/button_app.dart';
import 'package:efreshily/presentation/widgets/go.dart';
import 'package:efreshily/presentation/widgets/text_app.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerificationCode extends StatefulWidget {
  const VerificationCode({Key? key}) : super(key: key);

  @override
  State<VerificationCode> createState() => _VerificationCodeState();
}

class _VerificationCodeState extends State<VerificationCode> {

  TextEditingController codeController = TextEditingController();//..text="1023170331";
  final _formKey = GlobalKey<FormState>();

  StreamController<ErrorAnimationType>? errorController;
  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController!.close();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldColor,
      appBar: AppBarAll(nameAppBar: S.of(context).verification_code, showBack: true),
      body: Stack(
        children: [
          SafeArea(
              child: Form(
                  key: _formKey,
                  child:ListView(
                padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
                children: [

                  Row(),
                  const SizedBox(height: 55,),


                  TextApp(
                    text: S.of(context).verification_codeEnter,
                    color: Colors.black,
                    maxLines: 1,
                    fontSize: 25,
                    textAlign: TextAlign.start,
                    fontWeight: FontWeight.w700,
                  ),

                  const SizedBox(height: 10,),


                  TextApp(
                    text: S.of(context).verification_codeSend,
                    color: Colors.black,
                    maxLines: 3,
                    fontSize: 15,
                    textAlign: TextAlign.start,
                    fontWeight: FontWeight.w400,
                  ),


                  const SizedBox(height: 45,),



                  Padding(
                    padding:const EdgeInsets.only(left: 19,right: 19),
                    child:Directionality(
                        textDirection: TextDirection.ltr,
                        child: PinCodeTextField(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          keyboardType: TextInputType.number,
                          enablePinAutofill: true,
                          length: 4,
                          onChanged: (code) {
                          },
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                              RegExp("[0-9]"),
                            ),
                          ],
                          appContext: context,
                          controller: codeController,
                          animationType: AnimationType.fade,
                          animationDuration: const Duration(milliseconds: 300),
                          backgroundColor:Colors.transparent,
                          enableActiveFill: true,
                          showCursor: true,
                          blinkWhenObscuring: true,
                          onCompleted: (e){
                            debugPrint(e);
                          },
                          errorAnimationController: errorController,
                          pinTheme: PinTheme(
                            activeColor: Colors.grey,
                            inactiveColor:Colors.black.withOpacity(.1),
                            activeFillColor:const Color(0xfffdb813),
                            fieldHeight: 50,
                            shape: PinCodeFieldShape.box,
                            borderRadius: BorderRadius.circular(8),
                            borderWidth: 1,
                            fieldWidth: 50,
                            disabledColor: Colors.white.withOpacity(.411113),
                            inactiveFillColor:Colors.transparent,
                            selectedFillColor: Colors.white.withOpacity(.11113),
                            selectedColor: const Color(0xfffdb813),
                          ),

                          pastedTextStyle: TextStyle(
                            color: Colors.green.shade600,
                            fontWeight: FontWeight.bold,
                          ),
                          obscureText: false,
                          obscuringCharacter: '*',
                          // obscuringWidget: FlutterLogo(
                          //   size: 24,
                          // ),
                        )
                    ),

                  ),

                  const SizedBox(height: 36,),



                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextApp(
                        text: S.of(context).resendText,
                        color:  const Color(0xffabb4bd),
                        maxLines: 1,
                        fontSize: 13,
                        textAlign: TextAlign.end,
                        fontWeight: FontWeight.w400,
                      ),


                      const SizedBox(width: 5,),

                      InkWell(
                        onTap:(){
                        },
                        child:TextApp(
                          text: S.of(context).resend,
                          color: const Color(0xfff7941d),
                          maxLines: 1,
                          fontSize: 15,
                          textAlign: TextAlign.end,
                          fontWeight: FontWeight.w700,
                          underLine: true,
                        ),
                      ),

                    ],
                  ),

                  const SizedBox(height: 82,),
                  //
                  ButtonApps(
                    ontap: (){
                      // if (_formKey.currentState!.validate()) {}
                      Go.to(context: context, page: const ChangePassword());
                    },
                    maxHeight: 50,
                    maxWidth: MediaQuery.of(context).size.width*.80,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    colorBorder:primaryColor,
                    colorsText: whiteColor,
                    colorsButton: primaryColor,
                    textButton: S.of(context).next,
                  ),






                  const SizedBox(height: 30,),


                ],
              )
          ),
          )
        ],
      ),
    );
  }
}
