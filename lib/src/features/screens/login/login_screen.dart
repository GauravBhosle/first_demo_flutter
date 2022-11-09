import 'package:first_demo_flutter/src/common_widgets/form/form_header_widget.dart';
import 'package:flutter/material.dart';

import '../../../constants/images/image_strings.dart';
import '../../../constants/values/values.dart';
import 'widgets/login_buttom_widget.dart';
import 'widgets/login_form_widget.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  var emailText=TextEditingController();
  var passwordText=TextEditingController();



  @override
  Widget build(BuildContext context) {

    final size = MediaQuery
        .of(context)
        .size;
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: defaultSize),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FormHeaderWidget(image: WelcomeScreenImage, text1: "Welcome", text2: "Make it work, Make it right, Make it fast"),
                        LoginForm(),
                        LoginButtomWidget()
                      ],
                    ),
                  ),
                ]
              )
          )
      ),
    );
  }
}



