import 'package:flutter/material.dart';

class FormHeaderWidget extends StatelessWidget{

  final String image;
  final String text1;
  final String text2;

  const FormHeaderWidget({super.key, required this.image, required this.text1, required this.text2});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 30),
            child: Image(
              image: AssetImage(image),
              height: size.height * 0.2,
            ),
          ),
          Text(text1,
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 24)
          ),
          Text(text2
          ),

        ]
    );
  }

}