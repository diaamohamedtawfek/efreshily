import 'package:efreshily/presentation/ui/auth/forrget_password.dart';
import 'package:efreshily/presentation/ui/onbording.dart';
import 'package:efreshily/presentation/widgets/app_bar_all.dart';
import 'package:flutter/material.dart';
import 'package:efreshily/core/resources/colors_app.dart';
import 'package:efreshily/generated/l10n.dart';
import 'package:efreshily/presentation/ui/auth/sign_up.dart';
import 'package:efreshily/presentation/widgets/button_app.dart';
import 'package:efreshily/presentation/widgets/edit_text.dart';
import 'package:efreshily/presentation/widgets/go.dart';
import 'package:efreshily/presentation/widgets/text_app.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController emailController = TextEditingController();//..text="1023170331";
  TextEditingController passwordController = TextEditingController();//..text="mdiaa7788";
  final _formKey = GlobalKey<FormState>();
  bool showPassword=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldColor,
      appBar: AppBarAll(nameAppBar: S.of(context).login, showBack: false),
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
                    text: S.of(context).welcome,
                    color: Colors.black,
                    maxLines: 1,
                    fontSize: 25,
                    textAlign: TextAlign.start,
                    fontWeight: FontWeight.w700,
                  ),

                  const SizedBox(height: 10,),


                  TextApp(
                    text: S.of(context).please_login,
                    color: Colors.black,
                    maxLines: 3,
                    fontSize: 15,
                    textAlign: TextAlign.start,
                    fontWeight: FontWeight.w400,
                  ),


                  const SizedBox(height: 45,),
                  //
                  EditText(
                    controller: emailController,
                    onChanged: (e){},
                    numLine: 1,
                    // border: false,
                    enabled: true,
                    hintText: S.of(context).yourEmail,
                    labelText: S.of(context).yourEmail,
                    maxLine: 1,
                    obscureText: false,
                    textInputType: TextInputType.emailAddress,
                    validator: (value)=>!RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value!)?"Enter Valid Email like  info@gmail.com ":null,
                  ),




                  const SizedBox(height: 50,),



                  passwordWidget(S.of(context).password, S.of(context).password,),

                  const SizedBox(height: 20,),



                  InkWell(
                    onTap: (){
                      Go.to(context: context, page: const ForgetPassword());
                    },
                    child: TextApp(
                      text: S.of(context).forgetPassword,
                      color: const Color(0xff4eaceb),
                      maxLines: 1,
                      fontSize: 13,
                      textAlign: TextAlign.end,
                      fontWeight: FontWeight.w400,
                    ),
                  ),


                  const SizedBox(height: 82,),
                  //
                  ButtonApps(
                    ontap: (){
                      // if (_formKey.currentState!.validate()) {}
                      Go.to(context: context, page: const OnBoardingScreen());
                    },
                    maxHeight: 50,
                    maxWidth: MediaQuery.of(context).size.width*.80,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    colorBorder:primaryColor,
                    colorsText: whiteColor,
                    colorsButton: primaryColor,
                    textButton: S.of(context).login,
                  ),


                  const SizedBox(height: 36,),

                  // // * --- sign_up

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextApp(
                        text: S.of(context).don_have_account,
                        color:  const Color(0xffabb4bd),
                        maxLines: 1,
                        fontSize: 13,
                        textAlign: TextAlign.end,
                        fontWeight: FontWeight.w400,
                      ),


                      const SizedBox(width: 5,),

                      InkWell(
                        onTap:(){
                          Go.to(context: context, page: const SignUp());
                        },
                        child:TextApp(
                        text: S.of(context).sign_up,
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


                  const SizedBox(height: 20,),

                 Center(
                   child:  TextApp(
                     text: S.of(context).privacyPolicy ,
                     color:  const Color(0xff3ea5e9),
                     maxLines: 1,
                     fontSize: 16,
                     textAlign: TextAlign.end,
                     fontWeight: FontWeight.w400,
                   ),
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


  Widget passwordWidget(labelText,hintText){
    return TextFormField(
      enabled: true,
      minLines: 1 ,
      maxLines: 1,
      obscureText: showPassword,
      onChanged: (e){},
      validator:  (e){
        return null;
      },
      controller: passwordController,
      cursorColor: const Color(0xff212660),
      onEditingComplete: () => FocusScope.of(context).nextFocus(),
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: labelText ?? "",
        hintText: hintText ?? "",
        contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color:  Color(0x58abb4bd)),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xfff7941d)),
        ),
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              showPassword=!showPassword;
            });
          },
          child:
          showPassword==true?
          const Icon(
            Icons.visibility_off,
            color: Color(0xff707070),
            size: 25,
          ):const Icon(
            Icons.visibility,
            color: Color(0xff707070),
            size: 25,
          ),
        ),
        labelStyle:  const TextStyle(
          fontFamily: 'Roboto',
          color: Color(0xffabb4bd),
          fontSize: 13,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        hintStyle: const TextStyle(
          fontFamily: 'Roboto',
          color: Color(0xffabb4bd),
          fontSize: 13,
          fontWeight: FontWeight.w400,
        ),
      ),
      style: const TextStyle(
        fontFamily: 'Roboto',
        color: Colors.black,
        fontSize: 13,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
    );
  }

}
