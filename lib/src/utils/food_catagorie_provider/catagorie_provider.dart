import 'package:first_demo_flutter/src/constants/app_colors/AppColors.dart';
import 'package:first_demo_flutter/src/constants/images/image_strings.dart';
import 'package:flutter/material.dart';

import '../../features/models/food_catagories_todo.dart';

class CatagorieProvider{

  static List<FoodCatagoriesTodo> getFoodCatagories(){
    return [
      FoodCatagoriesTodo(
          name: "Carnes",
          icon: 'c',
          color: AppColors.MEATS,
          imgName: cat1,
          subfoodCatagoriesTodo:[]
      ),FoodCatagoriesTodo(
          name: "Frutus",
          icon: 'h',
          color: AppColors.FRUITS,
          imgName: cat2,
          subfoodCatagoriesTodo:[]
      ),FoodCatagoriesTodo(
          name: "Vegitales",
          icon: 'g',
          color:AppColors.VEGS,
          imgName: cat3,
          subfoodCatagoriesTodo:[]
      ),FoodCatagoriesTodo(
          name: "Simellas",
          icon: 'e',
          color: AppColors.SEEDS,
          imgName: cat4,
          subfoodCatagoriesTodo:[]
      ),FoodCatagoriesTodo(
          name: "Dulces",
          icon: 'd',
          color: AppColors.PASTRIES,
          imgName: cat5,
          subfoodCatagoriesTodo:[]
      ),FoodCatagoriesTodo(
          name: "Especies",
          icon: 'f',
          color: AppColors.SPICES,
          imgName: cat6,
          subfoodCatagoriesTodo:[]
      )
    ];
  }

}