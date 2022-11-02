
import 'package:first_demo_flutter/src/features/screens/home/setting_screen.dart';
import 'package:flutter/material.dart';

import '../../../constants/app_colors/AppColors.dart';
import '../../../utils/food_catagorie_provider/catagorie_provider.dart';
import '../../models/food_catagories_todo.dart';
import 'cart_screen.dart';
import 'fav_screen.dart';
import 'food_list_screen.dart';

class HomeScreen extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => _HomeScreen();

}

class _HomeScreen extends State<HomeScreen>{
  int pageIndex=0;
  
  final screen=[
    FoodListScreen(),
    CartScreen(),
    FavScreen(),
    Settings()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
      ),
      body: Container(
        child:
            screen[pageIndex],
      ),
      bottomNavigationBar: buttomNav(context),
    );
  }

  Container buttomNav(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow:[
            BoxShadow(
                blurRadius: 20,
                color: Colors.black.withOpacity(0.2),
                offset: Offset.zero
            )
          ]
      ),
      height: 80,
      padding: EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ClipOval(
            child: Material(
              child: IconButton(
                icon: Icon(Icons.home, color: AppColors.MAIN_COLOR,),
                onPressed: (){
                  setState(() {
                    pageIndex=0;
                  });
                },
              ),
            ),
          ),
          ClipOval(
            child:  Material(
              child: IconButton(
                icon: Icon(Icons.shopping_cart, color: AppColors.MAIN_COLOR,),
                onPressed: (){
                  setState(() {
                    pageIndex=1;
                  });
                },
              ),
            ),
          ),
          ClipOval(
            child: Material(
              child: IconButton(
                icon: Icon(Icons.favorite, color: AppColors.MAIN_COLOR,),
                onPressed: (){
                  setState(() {
                    pageIndex=2;
                  });
                },
              ),
            ),
          ),
          ClipOval(
            child: Material(
              child: IconButton(
                icon: Icon(Icons.settings, color: AppColors.MAIN_COLOR,),
                onPressed: (){
                  setState(() {
                    pageIndex=3;
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