import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../models/category.dart';
import '../widgets/category_item.dart';
import '../models/meal.dart';


class CategoriesScreen extends StatelessWidget {
  static const routeName = '/categories_screen';

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(20),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        // maxCrossAxisExtent is for responsiveness, if any screen is of 300pixel width  it will show 1 grid per row
        maxCrossAxisExtent: 200,
        //childAspectRatio => height/width ratio
        childAspectRatio: 3/2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: DummyCategories.map((ct)=> CategoryItem(
        ct.id,
        ct.title,
        ct.color,
      )).toList()
    );
  }
}
