import 'package:first_demo_flutter/src/features/models/food_catagories_todo.dart';
import 'package:flutter/material.dart';

class FoodListCardView extends StatelessWidget{
  late FoodCatagoriesTodo foodCatagoriesTodo;

  FoodListCardView(FoodCatagoriesTodo this.foodCatagoriesTodo);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(20),
        height: 150,
        child: Stack(
          children: [
            Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    this.foodCatagoriesTodo.imgName,
                    fit: BoxFit.cover,
                  ),
                )),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 120,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                    gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black.withOpacity(0.7),
                          Colors.transparent
                        ])),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    SizedBox(width: 10,),
                    ClipOval(
                      child: Container(
                        color: this.foodCatagoriesTodo.color,
                        padding: EdgeInsets.all(10),
                        child: Text(
                          this.foodCatagoriesTodo.icon,
                          style: TextStyle(
                              color: Colors.white, fontSize: 30),
                        ),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Text(
                      this.foodCatagoriesTodo.name,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25
                      ) ,)
                  ],
                ),
              ),
            )
          ],
        ));
  }

}