import 'package:flutter/material.dart';

import '../models/meals.dart';

import '../widgets/meal_item.dart';

class MealList extends StatelessWidget {
  // const MealCard({super.key});

  final List<Meal> meals;
  const MealList(this.meals);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (bc, index) {
        // return Text(meals[index].title);
        return MealItem(
          id: meals[index].id,
          title: meals[index].title,
          affordability: meals[index].affordability,
          complexity: meals[index].complexity,
          duration: meals[index].duration,
          imageUrl: meals[index].imageUrl,
          // removeItem: _deleteMeal,
        );
      },
      itemCount: meals.length,
    );
  }
}
