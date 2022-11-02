import 'package:first_demo_flutter/src/common_widgets/form/form_header_widget.dart';
import 'package:first_demo_flutter/src/constants/app_colors/AppColors.dart';
import 'package:first_demo_flutter/src/constants/images/image_strings.dart';
import 'package:first_demo_flutter/src/constants/values/values.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(defaultSize),
            child: Column(
              children: [
                FormHeaderWidget(
                    image: WelcomeScreenImage,
                    text1: 'Sign Up',
                    text2: "Create profile and start your jounery"),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            label: Text("Full Name"),
                            labelStyle: TextStyle(color: Colors.black),
                            prefixIcon: Icon(Icons.person,color: AppColors.MAIN_COLOR,),
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: AppColors.MAIN_COLOR)
                            )
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              label: Text("E-Mail"),
                              labelStyle: TextStyle(color: Colors.black ),
                              prefixIcon: Icon(Icons.person,color: AppColors.MAIN_COLOR,),
                              border: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: AppColors.MAIN_COLOR)
                              )
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              label: Text("Phonse No."),
                              labelStyle: TextStyle(color: Colors.black),
                              prefixIcon: Icon(Icons.person,color: AppColors.MAIN_COLOR,),
                              border: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: AppColors.MAIN_COLOR)
                              )
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              label: Text("Password"),
                              labelStyle: TextStyle(color: Colors.black),
                              prefixIcon: Icon(Icons.person,color: AppColors.MAIN_COLOR,),
                              border: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: AppColors.MAIN_COLOR)
                              )
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
