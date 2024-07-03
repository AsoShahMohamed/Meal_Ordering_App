import 'package:flutter/material.dart';

import './categories_screen.dart';
import './favourites_screen.dart';
import '../widgets/main_screen_drawer.dart';
import '../models/meals.dart';

class TabBarScreen extends StatefulWidget {
  final List<Meal> favouriteMeals;

  const TabBarScreen(this.favouriteMeals);

  @override
  State<TabBarScreen> createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {
  int _selectedPageIndex = 0;
  List<Map<String, Object>> _screens = [];
  @override
  void initState() {
    _screens = [
      {'screenTitle': 'Categories', 'screen': CategoriesScreen()},
      {
        'screenTitle': 'Favourties',
        'screen': FavouritesScreen(widget.favouriteMeals)
      }
    ];
    super.initState();
  }

  void _changePageIndex(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MainDrawer(),
        appBar: AppBar(
            title: Text(_screens[_selectedPageIndex]['screenTitle'] as String)),
        body: _screens[_selectedPageIndex]['screen'] as Widget,
        bottomNavigationBar: BottomNavigationBar(
            unselectedLabelStyle: const TextStyle(fontFamily: 'Roboto'),
            selectedLabelStyle: const TextStyle(fontFamily: 'Roboto'),
            showUnselectedLabels: true,
            type: BottomNavigationBarType.shifting,
            unselectedItemColor: Theme.of(context).colorScheme.onBackground,
            selectedItemColor: Theme.of(context).colorScheme.background,
            elevation: 15,
            currentIndex: _selectedPageIndex,
            onTap: _changePageIndex,
            backgroundColor: Theme.of(context).colorScheme.primary,
            items: [
              BottomNavigationBarItem(
                  icon: const Icon(Icons.category),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  label: 'Categories',
                  tooltip: 'go to categories'),
              BottomNavigationBarItem(
                  icon: const Icon(Icons.favorite_outline),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  label: 'Favourites',
                  tooltip: 'show favourite Meals'),
            ]));
  }
}



//  return DefaultTabController(
//       initialIndex: 1,
//       length: 2,
//       child: Scaffold(
//           appBar: AppBar(
//             title: const Text('Meals'),
//             bottom: TabBar(
//                 unselectedLabelColor: Theme.of(context).colorScheme.secondary,
//                 indicatorWeight: 3.0,
//                 labelStyle: const TextStyle(fontFamily: 'Roboto'),
//                 indicatorColor: Theme.of(context).colorScheme.onBackground,
//                 tabs: const <Widget>[
//                   Tab(icon: Icon(Icons.category), text: 'Categories'),
//                   Tab(icon: Icon(Icons.star), text: 'Favourites')
//                 ]),
//           ),
//           body: TabBarView(children: <Widget>[
//             CategoriesScreen(),
//             FavouritesScreen(),
//           ])),
//     );