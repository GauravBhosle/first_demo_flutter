import 'dart:convert';
import 'dart:ffi';

import 'package:first_demo_flutter/src/common_widgets/form/form_header_widget.dart';
import 'package:first_demo_flutter/src/constants/app_colors/AppColors.dart';
import 'package:first_demo_flutter/src/constants/images/image_strings.dart';
import 'package:first_demo_flutter/src/constants/values/values.dart';
import 'package:first_demo_flutter/src/features/models/user_todo.dart';
import 'package:first_demo_flutter/src/localizations/service.dart';
import 'package:first_demo_flutter/src/utils/validation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  // final nameController = TextEditingController();
  // final phoneController = TextEditingController();
  // final passController = TextEditingController();
  // final emailController = TextEditingController();
  // final confPassController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _email = '';
  String _pass = '';
  int? _phone = null;
  String _confPass='';

  bool _submitBtn=false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: defaultSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FormHeaderWidget(
                    image: WelcomeScreenImage,
                    text1: 'Sign Up',
                    text2: "Create profile and start your jounery"),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: defaultSize,
                        ),
                        TextFormField(
                          // controller: nameController,
                          decoration: InputDecoration(
                              label: Text("Full Name"),
                              labelStyle: TextStyle(color: Colors.black),
                              prefixIcon: Icon(
                                Icons.person,
                                color: AppColors.MAIN_COLOR,
                              ),
                              border: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColors.MAIN_COLOR)
                              )
                          ),
                          autovalidateMode: _submitBtn ? AutovalidateMode.onUserInteraction : AutovalidateMode.disabled,
                          validator: (text) {
                            return Validation.validateName(text);
                          },
                          onChanged: (text) {
                            setState(() {
                              _name = text;
                            });
                          },
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        TextFormField(
                          // controller: emailController,
                          decoration: InputDecoration(
                              label: Text("E-Mail"),
                              labelStyle: TextStyle(color: Colors.black),
                              prefixIcon: Icon(
                                Icons.mail,
                                color: AppColors.MAIN_COLOR,
                              ),
                              border: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColors.MAIN_COLOR))),
                          autovalidateMode: _submitBtn ? AutovalidateMode.onUserInteraction : AutovalidateMode.disabled,
                          validator: (text) {
                            return Validation.validateEmail(text);
                          },
                          onChanged: (text){
                            setState((){
                              _email=text;
                            });
                          },
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        TextFormField(
                          // controller: phoneController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            label: Text("Phone No."),
                            labelStyle: TextStyle(color: Colors.black),
                            prefixIcon: Icon(
                              Icons.phone,
                              color: AppColors.MAIN_COLOR,
                            ),
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppColors.MAIN_COLOR)),
                          ),
                          autovalidateMode: _submitBtn ? AutovalidateMode.onUserInteraction : AutovalidateMode.disabled,
                          validator: (text){
                            return Validation.validatePhone(text);
                          },
                          onChanged: (text){
                            setState(() {
                              _phone=int.parse(text);
                            });
                          },
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        TextFormField(
                          // controller: passController,
                          decoration: InputDecoration(
                              label: Text("Password"),
                              labelStyle: TextStyle(color: Colors.black),
                              prefixIcon: Icon(
                                Icons.fingerprint,
                                color: AppColors.MAIN_COLOR,
                              ),
                              border: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColors.MAIN_COLOR)
                              )
                          ),
                          autovalidateMode: _submitBtn ? AutovalidateMode.onUserInteraction : AutovalidateMode.disabled,
                          validator: (text){
                            return Validation.validatePassword(text);
                          },
                          onChanged: (text){
                            setState((){
                              _pass=text;
                            });
                          },
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        TextFormField(
                          // controller: confPassController,
                          decoration: InputDecoration(
                            label: Text("Confirm Password"),
                            labelStyle: TextStyle(color: Colors.black),
                            prefixIcon: Icon(Icons.fingerprint,color: AppColors.MAIN_COLOR,),
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.MAIN_COLOR
                              )
                            ),
                          ),
                          autovalidateMode: _submitBtn ? AutovalidateMode.always: AutovalidateMode.disabled,
                          validator: (text){
                            if(_pass.isEmpty){
                              return 'Please Enter above password first';
                            }
                            if(text==_pass){
                              return null;
                            }
                            return "Please make sure your password matches";
                          },
                          onChanged: (text){
                            setState(() {
                              _confPass=text;
                            });
                          },
                        ),
                        SizedBox(
                          height: defaultSize,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed:
                                _name.isNotEmpty ? saveDataInSharedPref : null,
                            child: Text(
                              "Submit",
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    AppColors.MAIN_COLOR)),
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

  Future<void> saveDataInSharedPref() async {
    setState(() => _submitBtn = true);
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      await SharedPrefernceHelper.init();

      UserTodo userTodo=new UserTodo(userName: _name, phoneNo: _phone, email: _email, password: _pass);
      String userString=jsonEncode(userTodo);

       List<String>? userStringList=await SharedPrefernceHelper.getUserList();
       var tempuserStringList=<String>[];

       if(userStringList!=null){
         print('truetrutruetrurereee');
         SharedPrefernceHelper.saveUserList(userStringList);
       }
       else{
         tempuserStringList.add(userString);
         SharedPrefernceHelper.saveUserList(tempuserStringList);
       }

      // SharedPrefernceHelper.saveUserName(_name);
      // SharedPrefernceHelper.saveUserEmail(_email);
      // SharedPrefernceHelper.saveUserPhone(_phone);
      // SharedPrefernceHelper.saveUserPassword(_pass);

      Navigator.pop(context);
    }
    else
      print("Validation Error");
  }
}
