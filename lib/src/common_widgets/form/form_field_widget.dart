import 'dart:convert';

import 'package:first_demo_flutter/src/features/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

import '../../constants/app_colors/AppColors.dart';
import '../../constants/values/values.dart';
import '../../features/models/user_todo.dart';
import '../../localizations/service.dart';
import '../../utils/validation.dart';

class FormFieldWidget extends StatefulWidget{

  var _formKey = GlobalKey<FormState>();
  String _name = '';
  String _email = '';
  String _pass = '';
  int? _phone = null;
  String _confPass='';

  bool _submitBtn=false;

  bool? addBtn;

  FormFieldWidget([this.index, this.userTodo,this.addBtn]);

  int? index=null;
  UserTodo? userTodo;


  @override
  State<StatefulWidget> createState() => _FormFieldWidgetState();


  
}

class _FormFieldWidgetState extends State<FormFieldWidget>{

  @override
  void initState() {
    super.initState();
    if(widget.userTodo != null){
      getList();
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    widget.userTodo=null;
    widget.index=null;

  }
  @override
  Widget build(BuildContext context) {
    return  Material(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Form(
          key: widget._formKey,
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
                initialValue: (widget.index) != null ? widget._name : '',
                autovalidateMode: widget._submitBtn ? AutovalidateMode.onUserInteraction : AutovalidateMode.disabled,
                validator: (text) {
                  return Validation.validateName(text);
                },
                onChanged: (text) {
                  setState(() {
                    widget._name = text;
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
                initialValue: (widget.index) != null ? widget._email : '',
                autovalidateMode: widget._submitBtn ? AutovalidateMode.onUserInteraction : AutovalidateMode.disabled,
                validator: (text) {
                  return Validation.validateEmail(text);
                },
                onChanged: (text){
                  setState((){
                    widget._email=text;
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
                initialValue: (widget.index) !=  null ? widget._phone.toString() : '',
                autovalidateMode: widget._submitBtn ? AutovalidateMode.onUserInteraction : AutovalidateMode.disabled,
                validator: (text){
                  return Validation.validatePhone(text);
                },
                onChanged: (text){
                  setState(() {
                    widget._phone=int.parse(text);
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
                        borderSide: BorderSide(color: AppColors.MAIN_COLOR)
                    )
                ),
                initialValue: (widget.index) != null ? widget._pass : '',
                autovalidateMode: widget._submitBtn ? AutovalidateMode.onUserInteraction : AutovalidateMode.disabled,
                validator: (text){
                  return Validation.validatePassword(text);
                },
                onChanged: (text){
                  setState((){
                    widget._pass=text;
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
                initialValue: (widget.index) != null ? widget._pass : '',
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
                },
              ),
              SizedBox(
                height: defaultSize,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed:
                  widget._name.isNotEmpty ? saveDataInSharedPref : null,
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




  Future<void> saveDataInSharedPref() async {
    setState(() => widget._submitBtn = true);
    if (widget._formKey.currentState!.validate()) {
      widget._formKey.currentState!.save();

      UserTodo userTodo=new UserTodo(userName: widget._name, phoneNo: widget._phone, email: widget._email, password: widget._pass);
      String userString=jsonEncode(userTodo);

      print(userString);

      List<String>? userStringList=await SharedPrefernceHelper.getUserList();
      var tempuserStringList=<String>[];

      if(widget.index != null){
        userStringList?.insert(widget.index!, userString);
        userStringList?.removeAt(widget.index! +1);
        print(userStringList);
        SharedPrefernceHelper.saveUserList(userStringList);
        widget.index=null;
        widget.userTodo=null;
        Navigator.pop(context);
      }
      else{
        if(userStringList!=null){
          print('truetrutruetrurereee');
          userStringList.add(userString);
          SharedPrefernceHelper.saveUserList(userStringList);
        }
        else{
          tempuserStringList.add(userString);
          SharedPrefernceHelper.saveUserList(tempuserStringList);
        }
        if(widget.addBtn== null){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
            return HomeScreen();
          }));
        }
        else if(widget.addBtn!=null){
          Navigator.pop(context);
        }
        // SharedPrefernceHelper.saveUserName(_name);
        // SharedPrefernceHelper.saveUserEmail(_email);
        // SharedPrefernceHelper.saveUserPhone(_phone);
        // SharedPrefernceHelper.saveUserPassword(_pass);


      }
    }
    else
      print("Validation Error");
  }


  void getList() {
    if(widget.userTodo != null){
      setState(() {
        widget._name=(widget.userTodo?.userName)!;
        widget._email=(widget.userTodo?.email)!;
        widget._phone=(widget.userTodo?.phoneNo)!;
        widget._pass=(widget.userTodo?.password)!;
        widget._confPass=(widget.userTodo?.password)!;
      });
    }

  }
}