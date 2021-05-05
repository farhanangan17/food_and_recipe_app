import 'package:flutter/material.dart';
import 'package:food_and_recipe/dummy_data.dart';
import 'package:food_and_recipe/screens/favorites_screen.dart';
import 'package:food_and_recipe/screens/filter_screen.dart';

import 'package:food_and_recipe/screens/meal_detail_screen.dart';
import 'screens/category_meals_screen.dart';
import 'screens/meal_detail_screen.dart';
import 'screens/filter_screen.dart';
import 'screens/catagories_screen.dart';
import 'screens/tabs_screen.dart';
import 'models/meal.dart';
import 'dummy_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = DummyMeals;

  void _setFilters(Map<String, bool> filterData){
    setState(() {
      _filters = filterData;
      _availableMeals = DummyMeals.where((meal){
        if(_filters['gluten'] && !meal.isGlutenFree){
          return false;
        }
        if(_filters['lactose'] && !meal.isLactoseFree){
          return false;
        }
        if(_filters['vegan'] && !meal.isVegan){
          return false;
        }
        if(_filters['vegetarian'] && !meal.isVegetarian){
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food&Recipe',
      theme: ThemeData(
        primarySwatch: Colors.red,
        accentColor: Colors.amberAccent,
        canvasColor: Color.fromRGBO(255, 254, 229, 1.0),
        fontFamily: 'OpenSans',
        textTheme: ThemeData.light().textTheme.copyWith(
          title: TextStyle(
            fontSize: 20,
            fontFamily: 'Quicksand',
            fontWeight: FontWeight.bold,
          ),
          body1: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
          ),
          body2: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
          ),

        ),
      ),
      debugShowCheckedModeBanner: false,
      // home: CategoriesScreen(),
      routes: {
        '/' : (ctx) => TabsScreen(),
        // '/' : (ctx) => CategoriesScreen(),
        CategoriesScreen.routeName : (ctx) => CategoriesScreen(),
        CategoryMealsScreen.routeName : (ctx) => CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
        FavoritesScreen.routeName: (ctx) => FavoritesScreen(),
        FiltersScreen.routeName: (ctx) => FiltersScreen(_filters, _setFilters),
      },
      //if anything unusual happens app will go to following page
      //below two paras are alternative of prev one(routes)
      // onGenerateRoute: (settings){
      //   print(settings.arguments);
      //   return MaterialPageRoute(builder: (ctx)=> CategoriesScreen());
      // },
      //if anything more seriously unusual happens app will go to following page
      onUnknownRoute: (settings){
        return MaterialPageRoute(builder: (ctx)=> CategoriesScreen());
      },
    );
  }
}