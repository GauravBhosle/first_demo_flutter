import 'package:first_demo_flutter/src/features/controllers/sign_up_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../constants/app_colors/AppColors.dart';
import '../../../../constants/values/values.dart';
import '../../../../utils/validation.dart';

class SignUpFormWidget extends StatefulWidget{

  String _name = '';
  String _email = '';
  String _pass = '';
  int? _phone = null;
  String _confPass='';
  bool _submitBtn=false;

  @override
  State<StatefulWidget> createState() => _SignUpFormWidgetState();

}

class _SignUpFormWidgetState extends State<SignUpFormWidget>{
  var _formKey = GlobalKey<FormState>();
  final controller = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return  Material(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: defaultSize,
              ),
              Visibility(
                visible: controller.isVisible.isTrue,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      controller.errormsg.string
                    )
                  ],
                ),
              ),
              SizedBox(
                height: defaultSize,
              ),
              TextFormField(
                controller: controller.name,
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
                autovalidateMode: widget._submitBtn ? AutovalidateMode.onUserInteraction : AutovalidateMode.disabled,
                validator: (text) {
                  return Validation.validateName(text);
                },
                onChanged: (text){
                  setState(() {
                    widget._name=text;
                  });
                },
              ),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                controller: controller.email,
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
                autovalidateMode: widget._submitBtn ? AutovalidateMode.onUserInteraction : AutovalidateMode.disabled,
                validator: (text) {
                  return Validation.validateEmail(text);
                },
                onChanged: (text){
                  setState(() {
                    widget._email=text;
                  });
                }
              ),

              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                controller: controller.phone,
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
                autovalidateMode: widget._submitBtn ? AutovalidateMode.onUserInteraction : AutovalidateMode.disabled,
                validator: (text){
                  return Validation.validatePhone(text);
                },
                  onChanged: (text){
                    setState(() {
                      widget._phone=int.parse(text);
                    });
                  }
              ),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                controller: controller.pass,
                decoration: InputDecoration(
                    label: Text("Password"),
                    labelStyle: TextStyle(color: Colors.black),
                    prefixIcon: Icon(
                      Icons.fingerprint,
                      color: AppColors.MAIN_COLOR,
                    ),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.MAIN_COLOR)
                    )
                ),
                autovalidateMode: widget._submitBtn ? AutovalidateMode.onUserInteraction : AutovalidateMode.disabled,
                validator: (text){
                  return Validation.validatePassword(text);
                },
                  onChanged: (text){
                    setState(() {
                      widget._pass=text;
                    });
                  }
              ),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                controller: controller.conpass,
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
                autovalidateMode: widget._submitBtn ? AutovalidateMode.always: AutovalidateMode.disabled,
                validator: (text){
                  if(widget._pass.isEmpty){
                    return 'Please Enter above password first';
                  }
                  if(text==widget._pass){
                    return null;
                  }
                  return "Please make sure your password matches";
                },
                  onChanged: (text){
                    setState(() {
                      widget._confPass=text;
                    });
                  }
              ),
              SizedBox(
                height: defaultSize,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() => widget._submitBtn = true);
                    if(_formKey.currentState!.validate()){
                      _formKey.currentState!.save();
                      SignUpController.instance.registerUser(controller.email.text.trim(), controller.pass.text.trim());
                    }
                  },
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
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

  }

}