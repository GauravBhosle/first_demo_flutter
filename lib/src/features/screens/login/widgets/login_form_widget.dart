import 'package:first_demo_flutter/src/constants/app_colors/AppColors.dart';
import 'package:first_demo_flutter/src/features/screens/home/home_screen.dart';
import 'package:first_demo_flutter/src/features/screens/students_form/student_form_screen.dart';
import 'package:flutter/material.dart';

import '../../students_list/students_list_screen.dart';

class LoginForm extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  LoginForm(this.emailController, this.passwordController);




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
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.person_outline_outlined),
              labelText: 'E-mail',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          TextFormField(
            controller: passwordController,
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.fingerprint),
                labelText: 'Password',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                    onPressed: null, icon: Icon(Icons.remove_red_eye_sharp))),
          ),
          Align(
            alignment: Alignment.centerRight,
            child:
                TextButton(onPressed: () => {}, child: Text('Forgot Password')),
          ),
          SizedBox(
            height: 30,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: (){
                String uemail=emailController.text.toString();
                String upassword=passwordController.text.toString();
                // Navigator.push(context, MaterialPageRoute(builder: (context){
                //   return Home(uemail,upassword);
                // })
                // );
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context){
                    return HomeScreen();
                  })
                );
                print("Email is "+ uemail +", " +"Password is "+upassword);
              },
              child: Text(
                'LOGIN',
                style: TextStyle(color: Colors.white),
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(AppColors.MAIN_COLOR)),
            ),
          )
        ],
      ),
    ));
  }


}
