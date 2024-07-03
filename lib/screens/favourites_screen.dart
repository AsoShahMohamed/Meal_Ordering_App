import 'package:flutter/material.dart';
import '../widgets/meals_list.dart';
import '../models/meals.dart';

class FavouritesScreen extends StatelessWidget {
  final List<Meal> favouriteMeals;
  const FavouritesScreen(this.favouriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favouriteMeals.isEmpty) {
      return Center(
        child: Text('There Are No Favourites!'),
      );
    }

    return MealList(favouriteMeals);
  }
}
