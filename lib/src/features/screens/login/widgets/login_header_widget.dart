import 'package:flutter/cupertino.dart';

import '../../../../constants/images/image_strings.dart';

class LoginHeaderWidget extends StatelessWidget {
  const LoginHeaderWidget({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Welcome',
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 24)
          ),
          Text('Make it work, make it right and make it fast'
          ),

        ]
    );
  }
}
