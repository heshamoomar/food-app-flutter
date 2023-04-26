import 'package:flutter/material.dart';
import '../screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(
      {super.key, required this.title, required this.color, required this.id});

  final String id;
  final String title;
  final Color color;

  // funtion for the on tap event
  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx)
        .pushNamed(CategoryMealsScreen.routeName, arguments: {'id': id, 'title': title});
  }

// the build widget will retrun a container with the category items
// to make each category tappable we wrap the container with
// a GestureDetector widget or InkWell widget
// they are the same but InkWell allows for visual feedback on pressing
// (ripple effect)
  @override
  Widget build(BuildContext context) {
    return InkWell(
      // what happens when tapping
      onTap: () => selectCategory(context),

      // configure the ripple effect
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),

      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
