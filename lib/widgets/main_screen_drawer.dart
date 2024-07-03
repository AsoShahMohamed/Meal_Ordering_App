import 'package:flutter/material.dart';
import 'package:mealorderscliche/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget _buildListTile(
      BuildContext context, String title, IconData icon, Function handler) {
    return ListTile(
      onTap: () => handler(),
      leading: Icon(
        icon,
        size: 26,
        color: Theme.of(context).colorScheme.onBackground,
      ),
      title: Text(title,
          style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onBackground)),
    );
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Drawer(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          semanticLabel: 'the main drawer is openning!!',
          backgroundColor: Theme.of(context).colorScheme.background,
          surfaceTintColor: Colors.red,
          child: Column(
            children: [
              Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: 100,
                  color: Theme.of(context).colorScheme.secondary,
                  child: Text('Main Menu',
                      style: TextStyle(
                          fontSize: 25,
                          color: Theme.of(context).colorScheme.onBackground,
                          fontWeight: FontWeight.bold))),
              const SizedBox(
                height: 10,
              ),
              _buildListTile(context, 'categories', Icons.restaurant_rounded,
                  () {
                Navigator.of(context).pushReplacementNamed('/');
              }),
              const SizedBox(
                height: 10,
              ),
              _buildListTile(context, 'Filters', Icons.settings, () {
                Navigator.of(context)
                    .pushReplacementNamed(FiltersScreen.routeNamme);
              })
            ],
          )),
    );
  }
}
