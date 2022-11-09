
import 'package:first_demo_flutter/src/features/screens/login/login_screen.dart';
import 'package:first_demo_flutter/src/repository/authentication_repository/authentication_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{
  static LoginController get instance => Get.find();

  late BuildContext context;

  final email=TextEditingController();
  final password=TextEditingController();

  Rx<String> errormsg=''.obs;
  var isVisible=false.obs;

  void loginUser(String email,String password)  {
    AuthenticationRepository.instance.loginUserWithEmailAndPass(email, password).catchError((onError){
      errormsg.value=onError;
      print("Error msg");
      print(onError);
      print(errormsg.value);
      isVisible.value=true;
      if(isVisible==true){
        update();
      }
    });

  }


}