import 'dart:io';

import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../widgets/meal_detail_item.dart';
import '../models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  final Function toggleFavorite;
  final Function isFavorite;

  MealDetailScreen(this.toggleFavorite, this.isFavorite);

  Widget buildSectionTitle(BuildContext ctx, String text){
    return Container(
      height: (MediaQuery.of(ctx).size.height - MediaQuery.of(ctx).padding.top - MediaQuery.of(ctx).padding.bottom)*0.03,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(text, style: Theme.of(ctx).textTheme.title,),
    );
  }

  Widget buildIngreContainer(BuildContext ctx, List<String> lstring){
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      height: (MediaQuery.of(ctx).size.height-MediaQuery.of(ctx).padding.top - MediaQuery.of(ctx).padding.bottom)*0.22,
      width: 300,
      child: ListView.builder(
        itemBuilder: (ctx, index){
          return Card(
            color: Theme.of(ctx).accentColor,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                lstring[index],
              ),
            ),
          );
        },
        itemCount: lstring.length,
      ),
    );
  }

  Widget buildStepsContainer(BuildContext ctx, List<String> lstring){
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      height: (MediaQuery.of(ctx).size.height-MediaQuery.of(ctx).padding.top - MediaQuery.of(ctx).padding.bottom)*0.22,
      width: 300,
      child: ListView.builder(
        itemBuilder: (ctx, index){
          return Column(
            children: <Widget>[
              ListTile (
                leading: CircleAvatar(child: Text('# ${(index+1)}'),),
                title: Text(lstring[index]),
              ),
              Divider(),
            ],
          );
        },
        itemCount: lstring.length,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //here as String because its parent pushed class had "arguments: " -> no {}
    final mealId = ModalRoute.of(context).settings.arguments as String;
    //.firstWhere indicates the end of searching after getting the value
    final selectedMeal = DummyMeals.firstWhere((meal){
      return meal.id.contains(mealId);
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeal.title}'),
      ),
      body: MealDetailItem(
        selectedMeal.imageUrl,
        selectedMeal.ingredients,
        selectedMeal.steps,
      ),
      floatingActionButton:
      Platform.isIOS
          ? Container()
          :FloatingActionButton(
        child: Icon(
          isFavorite(mealId)
            ?Icons.star
            :Icons.star_border
        ),
        onPressed: () => toggleFavorite(mealId),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
