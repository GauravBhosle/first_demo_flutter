import 'dart:ui';

class FoodCatagoriesTodo{
  String name;
  String icon;
  Color color;
  String imgName;
  List<FoodCatagoriesTodo> subfoodCatagoriesTodo;

  FoodCatagoriesTodo(
      {
        required this.name,
        required this.icon,
        required this.color,
        required this.imgName,
        required this.subfoodCatagoriesTodo
      }
  );
}