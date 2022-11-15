import 'package:first_demo_flutter/src/features/screens/get_api_calling/get_api_calling_screen.dart';
import 'package:first_demo_flutter/src/features/screens/home/setting_screen.dart';
import 'package:first_demo_flutter/src/features/screens/home/user_list/user_list_screen.dart';
import 'package:first_demo_flutter/src/repository/authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';

import '../../../constants/app_colors/AppColors.dart';
import 'fav_screen.dart';
import 'food_list_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  int pageIndex = 0;

  final screen = [UserListScreen(), FoodListScreen(), GetApiCallingScreen(), Settings()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              AuthenticationRepository.instance.logout();
            },
            icon: Icon(
              Icons.logout,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Container(
        child: screen[pageIndex],
      ),
      bottomNavigationBar: buttomNav(context),
    );
  }

  Container buttomNav(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            blurRadius: 20,
            color: Colors.black.withOpacity(0.2),
            offset: Offset.zero)
      ]),
      height: 80,
      padding: EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ClipOval(
            child: Material(
              child: IconButton(
                icon: Icon(
                  Icons.home,
                  color: AppColors.MAIN_COLOR,
                ),
                onPressed: () {
                  setState(() {
                    pageIndex = 0;
                  });
                },
              ),
            ),
          ),
          ClipOval(
            child: Material(
              child: IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                  color: AppColors.MAIN_COLOR,
                ),
                onPressed: () {
                  setState(() {
                    pageIndex = 1;
                  });
                },
              ),
            ),
          ),
          ClipOval(
            child: Material(
              child: IconButton(
                icon: Icon(
                  Icons.api,
                  color: AppColors.MAIN_COLOR,
                ),
                onPressed: () {
                  setState(() {
                    pageIndex = 2;
                  });
                },
              ),
            ),
          ),
          ClipOval(
            child: Material(
              child: IconButton(
                icon: Icon(
                  Icons.settings,
                  color: AppColors.MAIN_COLOR,
                ),
                onPressed: () {
                  setState(() {
                    pageIndex = 3;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
