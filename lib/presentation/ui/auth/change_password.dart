import 'package:efreshily/presentation/ui/auth/login.dart';
import 'package:efreshily/presentation/widgets/app_bar_all.dart';
import 'package:flutter/material.dart';
import 'package:efreshily/core/resources/colors_app.dart';
import 'package:efreshily/generated/l10n.dart';
import 'package:efreshily/presentation/widgets/button_app.dart';
import 'package:efreshily/presentation/widgets/go.dart';
import 'package:efreshily/presentation/widgets/text_app.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {

  TextEditingController passwordController = TextEditingController();//..text="mdiaa7788";
  TextEditingController rePasswordController = TextEditingController();//..text="mdiaa7788";
  final _formKey = GlobalKey<FormState>();
  bool showPassword=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldColor,
      appBar: AppBarAll(nameAppBar: S.of(context).setPassword, showBack: true),
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
                    text: S.of(context).setPassword,
                    color: Colors.black,
                    maxLines: 1,
                    fontSize: 25,
                    textAlign: TextAlign.start,
                    fontWeight: FontWeight.w700,
                  ),





                  const SizedBox(height: 50,),

                  passwordWidget(S.of(context).password, S.of(context).password,passwordController),
                  const SizedBox(height: 35,),

                  passwordWidget(S.of(context).rePassword, S.of(context).rePassword,rePasswordController),



                  const SizedBox(height: 82,),
                  //
                  ButtonApps(
                    ontap: (){
                      // if (_formKey.currentState!.validate()) {}
                      Go.toHomeAndRemmoveAllScreen(context: context, page: const Login());
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


                  const SizedBox(height: 36,),


                ],
              )
          ),
          )
        ],
      ),
    );
  }


  Widget passwordWidget(labelText,hintText,controller){
    return TextFormField(
      enabled: true,
      minLines: 1 ,
      maxLines: 1,
      obscureText: showPassword,
      onChanged: (e){},
      validator:  (e){
        return null;
      },
      controller: controller,
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
