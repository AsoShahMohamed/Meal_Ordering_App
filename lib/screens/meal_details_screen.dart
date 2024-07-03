import 'package:flutter/material.dart';

import '../dummy_data.dart';

class MealDetailsScreen extends StatelessWidget {
  static const routeName = '/meal-details';

  final Function toggleFavourite;
  final Function isFavourite;
  const MealDetailsScreen(this.isFavourite, this.toggleFavourite);

  Widget buildSectionTitle(
      BuildContext context, MediaQueryData mqd, String text) {
    return Container(
      width: mqd.size.width * 0.5,
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 5),
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 25),
      child: Text(text, style: Theme.of(context).textTheme.bodyLarge),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onBackground,
          borderRadius: BorderRadius.circular(5)),
    );
  }

  Widget _buildBorder(Widget widget, MediaQueryData mqd, BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(
        horizontal: mqd.size.width * 0.15,
        vertical: 10,
      ),
      width: double.infinity,
      height: mqd.size.height * 0.25,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
              width: 1,
              color: Theme.of(context).colorScheme.onBackground,
              strokeAlign: BorderSide.strokeAlignInside)),
      child: widget,
    );
  }

  @override
  Widget build(BuildContext context) {
    final routeInstance = ModalRoute.of(context);
    final String id;
    final meal;

    MediaQueryData mqd = MediaQuery.of(context);

    if (routeInstance != null) {
      id = routeInstance.settings.arguments as String;
    } else {
      return const Center(
        child: Text('undefined Route ',
            style: TextStyle(fontSize: 20, color: Colors.red)),
      );
    }

    meal = dummyMeals.firstWhere((meal) {
      return meal.id == id;
    });

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.of(context).pop(id);
          toggleFavourite(id);
        },
        child: isFavourite(id)
            ? const Icon(Icons.star_outline)
            : const Icon(Icons.star),
      ),
      appBar: AppBar(
        title: Text(meal.id),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: mqd.size.height * 0.4,
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, mqd, 'Ingredients'),
            _buildBorder(
                ListView.builder(
                  itemBuilder: (context, index) {
                    return Card(
                        color: Theme.of(context).colorScheme.secondary,
                        child: Text(
                          meal.ingredients[index],
                          style: Theme.of(context).textTheme.bodyLarge,
                        ));
                  },
                  itemCount: meal.ingredients.length,
                ),
                mqd,
                context),
            buildSectionTitle(context, mqd, 'Steps'),
            _buildBorder(
                ListView.builder(
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListTile(
                            leading: CircleAvatar(
                              backgroundColor:
                                  Theme.of(context).colorScheme.secondary,
                              child: Text(
                                '#${index + 1}',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ),
                            title: Text(meal.steps[index],
                                style:
                                    Theme.of(context).textTheme.titleMedium)),
                        const Divider(
                          thickness: 1,
                        ),
                      ],
                    );
                  },
                  itemCount: meal.steps.length,
                ),
                mqd,
                context)
          ],
        ),
      ),
    );
  }
}
