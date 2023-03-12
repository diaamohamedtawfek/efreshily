import 'package:efreshily/core/resources/colors_app.dart';
import 'package:efreshily/generated/l10n.dart';
import 'package:efreshily/presentation/widgets/app_bar_all.dart';
import 'package:efreshily/presentation/widgets/button_app.dart';
import 'package:efreshily/presentation/widgets/edit_text.dart';
import 'package:efreshily/presentation/widgets/text_app.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  TextEditingController nameController = TextEditingController();//..text="1023170331";
  TextEditingController phoneController = TextEditingController();//..text="1023170331";
  TextEditingController emailController = TextEditingController();//..text="1023170331";
  TextEditingController passwordController = TextEditingController();//..text="mdiaa7788";
  TextEditingController rePasswordController = TextEditingController();//..text="mdiaa7788";
  final _formKey = GlobalKey<FormState>();
  bool showPassword=false;
  bool reShowPassword=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldColor,
      appBar: AppBarAll(nameAppBar: S.of(context).sign_up, showBack: true),
      body: Stack(
        children: [

          SafeArea(
              child: Form(
                  key: _formKey,
                  child:ListView(
                    padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
                    children: [

                      Row(),
                      const SizedBox(height: 35,),


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


                      const SizedBox(height: 25,),
                      //
                      EditText(
                        controller: nameController,
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


                      const SizedBox(height: 15,),
                      //
                      EditText(
                        controller: phoneController,
                        onChanged: (e){},
                        numLine: 1,
                        // border: false,
                        enabled: true,
                        hintText: S.of(context).yourPhone,
                        labelText: S.of(context).yourPhone,
                        maxLine: 1,
                        obscureText: false,
                        textInputType: TextInputType.phone,
                        validator: (e){
                          return null;


                        },
                      ),


                      const SizedBox(height: 15,),
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




                      const SizedBox(height: 15,),
                      passwordWidget(S.of(context).password, S.of(context).password,passwordController),

                      const SizedBox(height: 15,),
                      passwordWidget(S.of(context).rePassword, S.of(context).rePassword,rePasswordController),



                      const SizedBox(height: 62,),
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
                        textButton: S.of(context).sign_up,
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
