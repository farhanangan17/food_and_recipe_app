import 'dart:io';

import 'package:flutter/material.dart';

import 'package:food_and_recipe/models/meal.dart';
import 'package:food_and_recipe/dummy_data.dart';
import 'package:food_and_recipe/screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final Function removeItem;

  MealItem({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
    @required this.removeItem,
  });

  String get complexityText{
    //switch is alternative of multiple if statement
    switch(complexity){
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default: return 'Unknown';
    }
  }

  String get affordabilityText{
    //switch is alternative of multiple if statement
    switch(affordability){
      case Affordability.Luxurious:
        return 'Luxurious';
        break;
      case Affordability.Costly:
        return 'Costly';
        break;
      case Affordability.Affordable:
        return 'Affordable';
        break;
      default: return 'Unknown';
    }
  }

  void selectMeal(BuildContext ctx){
    Navigator.of(ctx).pushNamed(
        MealDetailScreen.routeName,
        arguments: id,
    ).then((result) {
      if(result != null){
        removeItem(result);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        elevation: 5,
        margin: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.asset(
                    imageUrl,
                    height: 250,
                    // height: (mediaQuery.size.height -
                    //     mediaQuery.padding.top) * 0.3,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 0,
                  child: Container(
                    // padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                    width: 250,
                    color: Colors.black54,
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.schedule
                      ),
                      SizedBox(width: 5,),
                      Text('$duration min')
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                          Icons.work
                      ),
                      SizedBox(width: 5,),
                      Text(complexityText)
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                          Icons.attach_money
                      ),
                      // SizedBox(width: 10,),
                      Text(affordabilityText)
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
