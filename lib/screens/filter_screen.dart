import 'package:flutter/material.dart';

import 'package:food_and_recipe/widgets/main_drawer.dart';
import '../models/meal.dart';
import 'package:food_and_recipe/dummy_data.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegan = false;
  var _lactoseFree = false;
  var _vegetarian = false;

  @override
  initState(){
    _glutenFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegetarian = widget.currentFilters['vegetarian'];
    _vegan = widget.currentFilters['vegan'];
  }

  Widget _buildSwitchListTile(String title, String description, bool currentValue, Function updateValue){
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.save), onPressed: (){
            final selectedFilters = {
              'gluten': _glutenFree,
              'lactose': _lactoseFree,
              'vegan': _vegan,
              'vegetarian': _vegetarian,
            };
            widget.saveFilters(selectedFilters);
          })
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text('Adjust Your Meals', style: Theme.of(context).textTheme.title,),
          ),
          Expanded(
              child: ListView(
                children: <Widget>[
                  _buildSwitchListTile(
                    'Gluten-free',
                    'Only include gluten-free meals',
                    _glutenFree,
                    (newValue){
                      setState(() {
                        _glutenFree = newValue; //this is where _glutenFree or any 4of those become true or false.
                      });
                    }
                   ),
                  _buildSwitchListTile(
                    'Lactose-free',
                    'Only include lactose-free meals',
                    _lactoseFree,
                    (newValue){
                      setState(() {
                        _lactoseFree = newValue;
                      });
                    }
                  ),
                  _buildSwitchListTile(
                    'Vegan',
                    'Only include vegan meals',
                    _vegan,
                    (newValue){
                      setState(() {
                        _vegan = newValue;
                      });
                    }
                  ),
                  _buildSwitchListTile(
                    'vegetarian',
                    'Only include vegetarian meals',
                    _vegetarian,
                    (newValue){
                      setState(() {
                        _vegetarian = newValue;
                      });
                    }
                  )
                ],
              )
          )
        ]
      ),
    );
  }
}
