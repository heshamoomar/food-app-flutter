import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  const CategoryMealsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('the recipies'),
      ),
      body: const Center(
          child: Text(
        'recipes for meals',
      )),
    );
  }
}
