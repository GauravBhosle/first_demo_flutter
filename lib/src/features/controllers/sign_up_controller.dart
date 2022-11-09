import 'package:first_demo_flutter/src/repository/authentication_repository/authentication_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class SignUpController extends GetxController{
  static SignUpController get instance => Get.find();

  final email=TextEditingController();
  final name=TextEditingController();
  final phone=TextEditingController();
  final pass=TextEditingController();
  final conpass=TextEditingController();

  Rx<TextEditingController> errormsg=TextEditingController().obs;
  var isVisible=false.obs;


  void registerUser(String email,String password){
    AuthenticationRepository.instance.createUserWithEmailAndPass(email, password).catchError((onError){
      isVisible.value=true;
      errormsg.value=onError;
    });
  }
}