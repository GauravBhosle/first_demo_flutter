import 'dart:convert';

import 'package:flutter/foundation.dart';

class UserTodo{
  String? userName='';
  int? phoneNo=null;
  String? email='';
  String? password='';

  UserTodo({required this.userName, required this.phoneNo, required this.email, required this.password});


  //Converts Json data to user models
  factory UserTodo.fromJson(Map<String,dynamic> jsonData){
   return UserTodo(
       userName:jsonData['userName'],
       phoneNo:jsonData['phoneNo'],
       email:jsonData['email'],
       password:jsonData['password']
   );
  }

  //method that converts model to json
  Map<String,dynamic> toJson(){
    return {
      'userName':userName,
      'phoneNo':phoneNo,
      'email':email,
      'password':password
    };
  }




}