import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../widgets/category_item.dart';

// categories screen and favorites screen will not return schaffolds because they will not be controlling the entire screen of the app

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(25),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: DUMMY_CATEGORIES
          .map((catData) => CategoryItem(
                title: catData.title,
                color: catData.color,
                id: catData.id,
              ))
          .toList(),
    );
  }
}
