import 'package:flutter/material.dart';

import '../models/meal.dart';
import 'package:food_and_recipe/dummy_data.dart';

class MealDetailItem extends StatelessWidget {
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;

  MealDetailItem(this.imageUrl, this.ingredients, this.steps);

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
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            // height: 300,
            height: (MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top - MediaQuery.of(context).padding.bottom)*0.29,
            width: double.infinity,
            child: Image.asset(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          buildSectionTitle(context, 'Ingredients'),
          buildIngreContainer(context, ingredients),
          buildSectionTitle(context, 'Steps'),
          buildStepsContainer(context, steps),
        ],
      ),
    );
  }
}
