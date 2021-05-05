import 'package:flutter/material.dart';

import '../screens/catagories_screen.dart';
import '../screens/filter_screen.dart';
import '../models/meal.dart';
import 'package:food_and_recipe/dummy_data.dart';

class MainDrawer extends StatelessWidget {

  Widget buildListTile(BuildContext ctx, String title, IconData icon, Function taphandler){
    return ListTile(
      leading: Icon(icon, size: 26),
      title: Text(title, style: Theme.of(ctx).textTheme.title,),
      onTap: taphandler,
    );
  }


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text('Food & Recipe',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).primaryColor
              ),
            ),
          ),
          SizedBox(height: 20,),
          buildListTile(
              context,
              'Meals',
              Icons.restaurant,
              (){Navigator.of(context).pushReplacementNamed('/');}
          ),
          buildListTile(
            context,
            'Filters',
            Icons.settings,
            (){Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);}
          ),
          // ListTile(
          //   leading: Icon(Icons.restaurant, size: 26),
          //   title: Text('Meals', style: Theme.of(context).textTheme.title,),
          //   onTap: ()=>  selectPage(context),
          // ),
          // ListTile(
          //   leading: Icon(Icons.settings, size: 26),
          //   title: Text('Filters', style: Theme.of(context).textTheme.title,),
          //   onTap: () => selectPage(context),
          // ),
        ],
      ),
    );
  }
}
