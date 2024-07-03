import 'package:flutter/material.dart';
import '../widgets/main_screen_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeNamme = '/filters';

  final Map<String, bool> filters;
  final Function setFilters;
  const FiltersScreen(this.setFilters, this.filters);
  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

enum FilterTypes<Food> { isGlutenFree, isVegan, isVegetarian, isLactoseFree }

class _FiltersScreenState extends State<FiltersScreen> {
  bool _isGlutenFree = false;
  bool _isVegan = false;
  bool _isVegetarian = false;
  bool _isLactoseFree = false;

  @override
  void initState() {
    _isGlutenFree = widget.filters['isGlutenFree'] as bool;
    _isVegan = widget.filters['isVegan'] as bool;
    _isVegetarian = widget.filters['isVegetarian'] as bool;
    _isLactoseFree = widget.filters['isLactoseFree'] as bool;

    super.initState();
  }

  Widget _buildSwitchTile(
      String title, String subTitle, bool currentValue, FilterTypes type) {
    return SwitchListTile(
        title: Text(title),
        subtitle: Text(subTitle),
        value: currentValue,
        onChanged: (newVal) {
          setState(() {
            switch (type) {
              case FilterTypes.isGlutenFree:
                _isGlutenFree = newVal;
                break;
              case FilterTypes.isLactoseFree:
                _isLactoseFree = newVal;
                break;
              case FilterTypes.isVegan:
                _isVegan = newVal;
                break;
              case FilterTypes.isVegetarian:
                _isVegetarian = newVal;
                break;
              default:
                throw Exception('not existent Filter');
            }
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Filters'), actions: [
          IconButton(
              onPressed: () {
                final newFilters = {
                  'isGlutenFree': _isGlutenFree,
                  'isVegan': _isVegan,
                  'isVegetarian': _isVegetarian,
                  'isLactoseFree': _isLactoseFree
                };

                widget.setFilters(newFilters);
          
              },
              icon: const Icon(Icons.save))
        ]),
        body: Column(children: [
          Container(
              width: double.infinity,
              alignment: AlignmentDirectional.center,
              padding: const EdgeInsets.all(20),
              child: Text('Apply Filters',
                  style: Theme.of(context).textTheme.titleLarge)),
          Expanded(
            child: ListView(children: [
              _buildSwitchTile(
                'isGlutenFree',
                'apply filter',
                _isGlutenFree,
                FilterTypes.isGlutenFree,
              ),
              _buildSwitchTile(
                'isLactoseFree',
                'apply filter',
                _isLactoseFree,
                FilterTypes.isLactoseFree,
              ),
              _buildSwitchTile(
                'isVegan',
                'apply filter',
                _isVegan,
                FilterTypes.isVegan,
              ),
              _buildSwitchTile(
                'isVegetarian',
                'apply filter',
                _isVegetarian,
                FilterTypes.isVegetarian,
              ),
            ]),
          ),
        ]),
        drawer: MainDrawer());
  }
}
