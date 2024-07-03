import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
import '../models/meals.dart';
import '../widgets/meals_list.dart';
class CategoryMealsScreen extends StatefulWidget {
//   final String title;
//   final String id;

// const CategoryMealsScreen({required this.title,required this.id});

  final List<Meal> meals;

  const CategoryMealsScreen(this.meals);

  static const String routeName = '/category-meals';

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  var catTitle;
  var _displayedMeals;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final currentRoute = ModalRoute.of(context);
    final Map<String, String> routeArgs;

    final cid;

    if (currentRoute != null) {
      routeArgs = currentRoute.settings.arguments as Map<String, String>;
      catTitle = routeArgs['title'];
      cid = routeArgs['id'];

      _displayedMeals = widget.meals.where((meal) {
        return meal.categories.contains(cid);
      }).toList();
    }

    super.didChangeDependencies();
  }

  void _deleteMeal(String mealId) {
    setState(() {
      _displayedMeals.removeWhere((meal) {
        return meal.id == mealId;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(catTitle)),
      body: MealList(widget.meals)
    );
  }
}
