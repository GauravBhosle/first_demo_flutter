import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../constants/images/image_strings.dart';
import '../../sign_up/sign_up_Screen.dart';

class LoginButtomWidget extends StatelessWidget {
  const LoginButtomWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('OR'),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: (){},
            icon: Image(
              image: AssetImage(GoogleLogo),
              width: 20,
            ),
            label: Text('Sign-in with Google'),
          ),
        ),
        TextButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return SignUpScreen();
          }));
        },
            child: Text.rich(
                TextSpan(
                    text: 'Already have account?', style: Theme.of(context).textTheme.bodyText1,
                    children: [
                      TextSpan(text: 'SignUp',style: TextStyle(color: Colors.blue))
                    ]
                )
            )
        )
      ],
    );
  }
}
