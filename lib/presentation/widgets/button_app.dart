
import 'package:flutter/material.dart';

import 'text_app.dart';

class ButtonApps extends StatelessWidget{

  // final Function? ontap;
  final GestureTapCallback? ontap;
  final String? textButton;
  const ButtonApps({Key? key, this.textButton, this.ontap, this.colorsButton, this.colorsText,
    this.fontSize, this.fontWeight, this.maxWidth, this.maxHeight, this.colorBorder}) : super(key: key);


  final Color? colorsButton;
  final Color? colorBorder;
  final Color? colorsText;
  final double? fontSize;
  final FontWeight? fontWeight;

  final double? maxWidth;
  final double? maxHeight;
  @override
  Widget build(BuildContext context) {
    return InkWell(

      onTap: ontap,
      // onTap: (){
      //   print("button");
      // },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            // width: 147,
            // height: 45,
            constraints: BoxConstraints(
                maxWidth: maxWidth!,
                maxHeight: maxHeight!
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                boxShadow: const [BoxShadow(
                    color: Color(0xfffdb813),
                    offset: Offset(0, 3),
                    blurRadius: 10,
                    spreadRadius: 0
                )
                ],
                color: const Color(0xfff7941d)
            ),


            child: Center(
              child: TextApp(
                text: textButton ?? "",
                color: colorsText,
                fontSize: fontSize,
                fontWeight: fontWeight,

              ),
            ),
          )
        ],
      ),
    );
  }
}