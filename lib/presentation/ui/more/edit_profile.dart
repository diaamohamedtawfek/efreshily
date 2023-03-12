import 'package:cached_network_image/cached_network_image.dart';
import 'package:efreshily/core/resources/colors_app.dart';
import 'package:efreshily/generated/l10n.dart';
import 'package:efreshily/presentation/widgets/app_bar_all.dart';
import 'package:efreshily/presentation/widgets/button_app.dart';
import 'package:efreshily/presentation/widgets/edit_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {

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
      appBar: AppBarAll(nameAppBar: S.of(context).editProfile, showBack: true),
      body: Stack(
        children: [

          SafeArea(
              child: Form(
                  key: _formKey,
                  child:SingleChildScrollView(
                    child: Column(
                      children: [

                        Row(),
                        const SizedBox(height: 22,),
                        SizedBox(
                          height: 220,
                          width: MediaQuery.of(context).size.width,
                          child: Stack(
                            children: [

                              SvgPicture.asset("assets/images/color.svg",//height: 165,
                                fit: BoxFit.fitWidth,
                                width: MediaQuery.of(context).size.width,),

                              Align(
                                alignment: Alignment.bottomCenter,
                                child: SizedBox(
                                  height: 112,
                                  width: 125,
                                  child: Stack(
                                    children: [
                                      Container(
                                        width: 107,
                                        height: 107,
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
                                      Align(
                                        alignment: Alignment.bottomRight,
                                        child: Container(
                                            width: 53,
                                            height: 53,
                                            decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                boxShadow: [BoxShadow(
                                                    color: Color(0x29000000),
                                                    offset: Offset(0,3),
                                                    blurRadius: 6,
                                                    spreadRadius: 0
                                                )] ,
                                                color: Color(0xfff7941d)
                                            ),
                                          child: const Center(
                                            child:  Icon(Icons.camera_alt,size: 27,color: Colors.white,),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),


                            ],
                          ),
                        ),




                        Padding(
                          padding: const EdgeInsets.only(left: 12,right: 12),
                          child: Column(
                            children: [
                              const SizedBox(height: 22,),
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


                              const SizedBox(height: 22,),
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


                              const SizedBox(height: 22,),
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



                              const SizedBox(height: 22,),
                              passwordWidget(S.of(context).password, S.of(context).password,passwordController),

                              const SizedBox(height: 22,),
                              passwordWidget(S.of(context).rePassword, S.of(context).rePassword,rePasswordController),



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
          fontSize: 16,
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
