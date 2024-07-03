import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './screens/category_meals_screen.dart';

import './screens/meal_details_screen.dart';
import './screens/tabbar_screen.dart';
import './screens/filters_screen.dart';

import './dummy_data.dart';
import './models/meals.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> _filteredMeals = dummyMeals;

  List<Meal> _favouriteMeals = [];
  
  Map<String, bool> mealFilters = {
    'isGlutenFree': false,
    'isVegan': false,
    'isVegetarian': false,
    'isLactoseFree': false
  };

  bool _isFavourite(String mealId) {
    return _favouriteMeals.any((meal) {
      return meal.id == mealId;
    });
  }

  void _toggleFavourite(String mealId) {
    int index = _favouriteMeals.indexWhere((meal) {
      return meal.id == mealId;
    });

    if (index >= 0) {
      setState(
        () => _favouriteMeals.removeAt(index),
      );
    } else {
      setState(() {
        _favouriteMeals.add(dummyMeals.firstWhere((meal) {
          return mealId == meal.id;
        }));
      });
    }
  }

  void _applyFilters(Map<String, bool> filters) {
    setState(() {
      mealFilters = filters;

      _filteredMeals = dummyMeals.where((meal) {
        if (mealFilters['isGlutenFree'] as bool && !meal.isGlutenFree) {
          return false;
        }
        if (mealFilters['isVegan'] as bool && !meal.isVegan) {
          return false;
        }
        if (mealFilters['isVegetarian'] as bool && !meal.isVegetarian) {
          return false;
        }
        if (mealFilters['isLactoseFree'] as bool && !meal.isLactoseFree) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData(fontFamily: 'Raleway');
    return MaterialApp(
        title: 'Flutter Demo',
        theme: theme.copyWith(
            appBarTheme: theme.appBarTheme.copyWith(
                titleTextStyle:
                    const TextStyle(fontFamily: 'Raleway', fontSize: 22)),
            textTheme: theme.textTheme.copyWith(
                titleLarge: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Roboto',
                  color: Color(int.parse('29222A', radix: 16) + 0xFF000000),
                ),
                titleMedium: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Roboto',
                  color: Color(int.parse('29222A', radix: 16) + 0xFF000000),
                ),
                bodyLarge: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Roboto',
                  color: Color(int.parse('F1EFEE', radix: 16) + 0xFF000000),
                ),
                bodySmall: TextStyle(
                  fontSize: 12,
                  fontFamily: 'Roboto',
                  color: Color(int.parse('F1EFEE', radix: 16) + 0xFF000000),
                )),
            scaffoldBackgroundColor: Color(
                int.parse('#F1EFEE'.substring(1, 7), radix: 16) + 0xFF000000),
            colorScheme: theme.colorScheme.copyWith(
              onBackground: Color(int.parse('29222A', radix: 16) + 0xFF000000),
              surface: Color(int.parse('9D9D99', radix: 16) + 0xFF000000),
              primary: Color(
                  int.parse('#BA3F3F'.substring(1, 7), radix: 16) + 0xFF000000),
              background: Color(
                  int.parse('#F1EFEE'.substring(1, 7), radix: 16) + 0xFF000000),
              secondary: Color(
                  int.parse('#B97F6A'.substring(1, 7), radix: 16) + 0xFF000000),
            )),
        // home: CategoriesScreen(),
        initialRoute: '/',
        routes: {
          '/': (_) {
            return TabBarScreen(_favouriteMeals);
          },
          CategoryMealsScreen.routeName: (_) {
            return CategoryMealsScreen(_filteredMeals);
          },
          MealDetailsScreen.routeName: (_) {
            return MealDetailsScreen(_isFavourite,_toggleFavourite);
          },
          FiltersScreen.routeNamme: (_) {
            return FiltersScreen(_applyFilters, mealFilters);
          }
        },
        // onGenerateRoute: (settings) {

        // },
        onUnknownRoute: (settings) {
          return Platform.isIOS
              ? CupertinoPageRoute(
                  builder: (_) {
                    return TabBarScreen(_favouriteMeals);
                  },
                  settings: settings)
              : MaterialPageRoute(
                  builder: (_) {
                    return TabBarScreen(_favouriteMeals);
                  },
                  settings: settings);
        });
  }
}
