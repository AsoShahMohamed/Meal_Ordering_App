import 'package:flutter/material.dart';

import '../widgets/category_item.dart';
import '../dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  @override

  
  Widget build(BuildContext context) {
  return   GridView(
      padding: const EdgeInsets.all(15),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 16 / 9),
      children: dummyCategories.map((cat) {
        return CategoryItem(id: cat.id, title: cat.title, color: cat.color);
      }).toList(),
    );
  }
}
