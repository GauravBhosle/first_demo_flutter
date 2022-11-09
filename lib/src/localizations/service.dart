


import 'dart:ffi';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefernceHelper {
  static String  nameSharedPref= 'nameSharedPref';
  static String phoneSharedPref='phoneSharedPref';
  static String emailSharedPref='emailSharedPref';
  static String passSharedPref='passSharedPref';
  static String userListSharedPref="UserList";
  static late SharedPreferences sharedPreferences;



  static init() async {
    sharedPreferences=await SharedPreferences.getInstance();
  }


// Write DATA
  static saveUserName(value) async {
    await sharedPreferences.setString(nameSharedPref, value);
  }
  static saveUserPhone(value) async{
    await sharedPreferences.setInt(phoneSharedPref, value);
  }
  static saveUserEmail(value) async{
    await sharedPreferences.setString(emailSharedPref, value);
  }
  static saveUserPassword(value) async{
    await sharedPreferences.setString(passSharedPref, value);
  }
  static saveUserList(list) async{
    await sharedPreferences.setStringList(userListSharedPref, list);
  }


// Read Data
  static Future<String?> getUserName() async {
    return sharedPreferences.getString(nameSharedPref);
  }
  static Future<int?> getUserPhone() async{
    return sharedPreferences.getInt(phoneSharedPref);
  }
  static Future<String?> getUserEmail() async{
    return sharedPreferences.getString(emailSharedPref);
  }
  static Future<String?> getUserPassword() async{
    return sharedPreferences.getString(passSharedPref);
  }
  static Future<List<String>?> getUserList() async{
    return sharedPreferences.getStringList(userListSharedPref);
  }
  static Future<String?> getUserListString(index) async{
    return sharedPreferences.getStringList(userListSharedPref)?.elementAt(index);
  }

  //Delete Data
  static Future<void> deleteUserListfromIndex(index) async{
    sharedPreferences.getStringList(userListSharedPref)?.removeAt(index);
  }
}