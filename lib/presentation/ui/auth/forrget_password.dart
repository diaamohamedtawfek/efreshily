import 'package:efreshily/presentation/ui/auth/verigication_code.dart';
import 'package:efreshily/presentation/widgets/app_bar_all.dart';
import 'package:flutter/material.dart';
import 'package:efreshily/core/resources/colors_app.dart';
import 'package:efreshily/generated/l10n.dart';
import 'package:efreshily/presentation/widgets/button_app.dart';
import 'package:efreshily/presentation/widgets/edit_text.dart';
import 'package:efreshily/presentation/widgets/go.dart';
import 'package:efreshily/presentation/widgets/text_app.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {

  TextEditingController phoneController = TextEditingController();//..text="1023170331";
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldColor,
      appBar: AppBarAll(nameAppBar: S.of(context).forgetPassword, showBack: true),
      body: Stack(
        children: [
          SafeArea(
              child: Form(
                  key: _formKey,
                  child:ListView(
                padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
                children: [

                  Row(children: const [
                    SizedBox(height: 55,),
                  ],),



                  TextApp(
                    text: S.of(context).please_enter_your_phone,
                    color: Colors.black,
                    maxLines: 1,
                    fontSize: 25,
                    textAlign: TextAlign.start,
                    fontWeight: FontWeight.w700,
                  ),

                  const SizedBox(height: 10,),


                  TextApp(
                    text: S.of(context).please_enter_your_phoneText,
                    color: Colors.black,
                    maxLines: 3,
                    fontSize: 15,
                    textAlign: TextAlign.start,
                    fontWeight: FontWeight.w400,
                  ),


                  const SizedBox(height: 45,),

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



                  const SizedBox(height: 72,),
                  //
                  ButtonApps(
                    ontap: (){
                      // if (_formKey.currentState!.validate()) {}
                      Go.to(context: context, page: const VerificationCode());
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


                  const SizedBox(height: 46,),



                ],
              )
          ),
          )
        ],
      ),
    );
  }


}
