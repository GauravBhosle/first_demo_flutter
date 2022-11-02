import 'package:flutter/material.dart';

class MyTextFormFieldWidget extends StatelessWidget{

  final TextEditingController textEditingControler;
  final String fieldName;
  final IconData iconData;
  final Color prefixIconColor;

  const MyTextFormFieldWidget({
    Key? key,
    required this.textEditingControler,
    required this.fieldName,
    this.iconData = Icons.verified_outlined,
    this.prefixIconColor=Colors.blue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingControler,
      decoration: InputDecoration(
        labelText: fieldName,
        labelStyle: TextStyle(color: Colors.deepPurple,),
        prefixIcon: Icon(iconData,color: prefixIconColor,),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.deepPurple.shade100),
          borderRadius: BorderRadius.circular(6)
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.deepPurple.shade300),
        )
      ),
    );
  }

}