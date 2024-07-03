import 'package:flutter/material.dart';
import '../screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;
  final String id;

  const CategoryItem(
      {required this.id, required this.title, required this.color});

  void selectCategory(BuildContext bc) {
    // Navigator.of(bc).push(MaterialPageRoute(builder: (_) {
    //   return CategoryMealsScreen(id:id, title:title);
    // }));
    Navigator.of(bc).pushNamed(CategoryMealsScreen.routeName,
        arguments: {'title': title, 'id': id});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {selectCategory(context)},
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(colors: <Color>[
              color.withOpacity(0.5),
              color,
            ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        child: Text(title, style: Theme.of(context).textTheme.titleLarge),
      ),
    );
  }
}
