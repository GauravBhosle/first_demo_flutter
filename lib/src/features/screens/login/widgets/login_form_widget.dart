import 'dart:convert';
import 'package:first_demo_flutter/src/constants/app_colors/AppColors.dart';
import 'package:first_demo_flutter/src/features/models/user_todo.dart';
import 'package:first_demo_flutter/src/features/screens/home/home_screen.dart';
import 'package:first_demo_flutter/src/localizations/service.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isVisible = false;
  bool _obscureText = true;


  Future<void> validateUser(BuildContext context) async {

    await SharedPrefernceHelper.init();
    String? userEmail = await SharedPrefernceHelper.getUserEmail();
    String? userPass = await SharedPrefernceHelper.getUserPassword();



    List<UserTodo> userList=<UserTodo>[];
    List<String>? userStringList=await SharedPrefernceHelper.getUserList();
    if(userStringList!=null){
      for(int i=0;i<userStringList.length;i++){
        Map<String,dynamic> jsonData=jsonDecode(userStringList[i]);
        UserTodo userTodo=UserTodo.fromJson(jsonData);
        userList.add(userTodo);
        if(userList[i].email==emailController.text && userList[i].password==passwordController.text){
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return HomeScreen();
          }));
        }
        else {
          print("object");
          setState(() {
            isVisible = true;
          });
        }
      }
    }
    else{
      print('hafa');
      setState(() {
        isVisible=true;
      });
    }

//    print("Email is " + userEmail! + ", " + "Password is " + userPass!);

    // if (emailController.text.toString() == userEmail && userPass == passwordController.text.toString()) {
    //   Navigator.push(context, MaterialPageRoute(builder: (context) {
    //     return HomeScreen();
    //   }));
    //   isVisible = false;
    // } else {
    //   setState(() {
    //     isVisible = true;
    //   });
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Container(
      padding: const EdgeInsets.symmetric(vertical: 40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: emailController,
            decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.person_outline_outlined,
                ),
                labelText: 'E-mail',
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.MAIN_COLOR))),

          ),
          SizedBox(
            height: 10.0,
          ),
          TextFormField(
            controller: passwordController,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.fingerprint),
                focusColor: AppColors.MAIN_COLOR,
                labelText: 'Password',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(onPressed: (){
                 setState(() {
                   _obscureText=!_obscureText;
                 });
                }, icon:  Icon(
                  Icons.remove_red_eye_sharp,
                ),
                ),

                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.MAIN_COLOR)
                )
            ),
            obscureText: _obscureText,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Visibility(
                child: Text(
                  "Invalid Email or Password",
                  style: TextStyle(color: Colors.red),
                ),
                visible: isVisible,
              ),
              TextButton(onPressed: () => {}, child: Text('Forgot Password')),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(

              onPressed: () {
                validateUser(context);
              },
              child: Text(
                'LOGIN',
                style: TextStyle(color: Colors.white),
              ),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(AppColors.MAIN_COLOR)),
            ),
          )
        ],
      ),
    ));
  }



  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }


}
