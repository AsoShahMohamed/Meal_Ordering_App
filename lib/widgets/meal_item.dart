import 'package:flutter/material.dart';

import '../models/meals.dart';
import '../screens/meal_details_screen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final Complexity complexity;
  final Affordability affordability;
  final int duration;
  // final Function removeItem;

  String get getComplexity {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';

      case Complexity.Hard:
        return 'Hard';

      case Complexity.Challenging:
        return 'Challenging';

      default:
        return 'not defined';
    }
  }

  String get getAffordability {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
      case Affordability.Pricey:
        return 'Pricey';
      case Affordability.Luxurious:
        return 'Exclusive';
      default:
        return 'not defined';
    }
  }

  const MealItem(
      {required this.id,
      required this.title,
      required this.imageUrl,
      required this.complexity,
      required this.affordability,
      required this.duration,
      // required this.removeItem
      });

  void selectMeal(BuildContext context) {
    Navigator.of(context)
        .pushNamed(
      MealDetailsScreen.routeName,
      arguments: id,
    )
        .then((value) {
      if (value != null) {
        // removeItem(value as String);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        selectMeal(context);
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 5,
        child: Column(children: <Widget>[
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                child: Image.network(
                  imageUrl,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 10,
                right: 25,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(2)),
                  width: 250,
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                    softWrap: true,
                    overflow: TextOverflow.fade,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.schedule),
                    const SizedBox(
                      width: 5,
                    ),
                    Text('$duration min'),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.work),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(getComplexity),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.attach_money_outlined),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(getAffordability),
                  ],
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
