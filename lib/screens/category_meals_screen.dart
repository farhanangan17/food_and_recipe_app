import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
import '../models/meal.dart';
import 'package:food_and_recipe/dummy_data.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  final List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  // String categoryTitle;
  // List<Meal> displayedMeals;
  // bool _loadedInitData = false;
  //
  // // @override
  // //here we did not call setState because of initState the change is happening before page loads
  // void initState(){
  //   final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, String>;
  //   categoryTitle = routeArgs['title'];
  //   final categoryId = routeArgs['id'];
  //   displayedMeals = DummyMeals.where((meal){
  //     return meal.categories.contains(categoryId);
  //   }).toList();
  //   super.initState();
  // }

  //this is kind of alternative of initState
  // @override
  // void didChangeDependencies(){
  //   //this if condition here because still the meals were not deleted because
  //   // didChangeDependencies runs multiple times and it overrides _removeMeal but now because of the if statement it doesn't run multiple times.
  //   if(!_loadedInitData){
  //     //here as Map<String, String> because its parent pushed class had "arguments: {}'
  //     final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, String>;
  //     categoryTitle = routeArgs['title'];
  //     final categoryId = routeArgs['id'];
  //     displayedMeals = DummyMeals.where((meal){
  //       return meal.categories.contains(categoryId);
  //     }).toList();
  //     _loadedInitData = true;
  //   }
  //   super.didChangeDependencies();
  // }


  void _removeMeal(String mealId){
    setState(() {
      // displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final displayedMeals = widget.availableMeals.where((meal){
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index){
          return MealItem(
            id: displayedMeals[index].id,
            title: displayedMeals[index].title,
            imageUrl: displayedMeals[index].imageUrl,
            duration: displayedMeals[index].duration,
            complexity: displayedMeals[index].complexity,
            affordability: displayedMeals[index].affordability,
            // removeItem: _removeMeal,
          );
        },
        itemCount: displayedMeals.length,
      ),

    );
  }
}
