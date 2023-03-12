
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class EditTextBorder extends StatelessWidget{

  final bool? obscureText;
  final bool? enabled;
  final String? labelText;
  final String? hintText;
  final TextInputType? textInputType;
  final ValueChanged<String>? onChanged;
  // final Function? onChanged;
  final FormFieldValidator<String>? validator;
  // final Function? validator;
  final int? numLine;
  final int? maxLine;
  final int? maxLengthString;
  // final bool? border;
  final Widget? icons;

  final TextEditingController? controller;

  const EditTextBorder({Key? key, this.obscureText, this.icons,  this.maxLengthString, this.labelText,
    this.hintText, this.onChanged, this.validator, this.textInputType, this.numLine, this.enabled, this.controller,
    this.maxLine,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      enabled: enabled??true,
      minLines: numLine??1 ,
      maxLines: maxLine ?? 200,
      obscureText: obscureText!,
      onChanged: onChanged,
      validator:  validator,
      maxLength: maxLengthString,
      inputFormatters: textInputType==TextInputType.phone||textInputType==TextInputType.number?[
        FilteringTextInputFormatter.allow(RegExp("[0-9]")),
      ]:null,
      controller: controller,
      cursorColor:const Color(0xff212660),
      onEditingComplete: () => FocusScope.of(context).nextFocus(),
      keyboardType: textInputType,
      decoration: InputDecoration(
        fillColor: Colors.white,
        focusColor: Colors.white,
        hoverColor: Colors.white,

        labelText: labelText ?? "",
        hintText: hintText ?? "",
        contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),

        disabledBorder:
        OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: const BorderSide(
            color: Color(0x29000000),
          ),
        ),

        enabledBorder:
        OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: const BorderSide(
            color:Color(0x29000000),
          ),
        ),
        focusedBorder:
        OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: const BorderSide(
            color:Color(0x29000000),
          ),
        ),

        border:
        const OutlineInputBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(5),
              topLeft: Radius.circular(5),
              bottomLeft: Radius.circular(5),
              bottomRight: Radius.circular(5)
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