import 'package:first_demo_flutter/src/constants/app_colors/AppColors.dart';
import 'package:first_demo_flutter/src/features/screens/home/widgets/food_list_card_view.dart';
import 'package:first_demo_flutter/src/utils/food_catagorie_provider/catagorie_provider.dart';
import 'package:flutter/material.dart';

import '../../models/food_catagories_todo.dart';

class FoodListScreen extends StatefulWidget {
  List<FoodCatagoriesTodo> catagoriesList = CatagorieProvider.getFoodCatagories();


  @override
  State<StatefulWidget> createState() => FoodListScreenState();
}

class FoodListScreenState extends State<FoodListScreen>{
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            child: Text(
              "Select one categorie",
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.catagoriesList.length,
              itemBuilder: (BuildContext context, int index) {
                return FoodListCardView(
                    widget.catagoriesList[index]
                );
              },
            )),
        ]
    );
  }
  



    
}



