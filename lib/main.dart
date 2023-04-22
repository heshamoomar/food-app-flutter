import 'package:flutter/material.dart';
import 'package:food_app/screens/filters_screen.dart';
import 'package:food_app/screens/tabs_screen.dart';

import './screens/meal_detail_screen.dart';
import './screens/categories_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/filters_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
          //primaryColor: Colors.pink,
          appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(color: Colors.white),
            backgroundColor: Colors.deepPurpleAccent,
          ),
          colorScheme: ColorScheme.fromSwatch().copyWith(
            secondary: Colors.amber, // Accent color
          ),
          canvasColor: const Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyLarge: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyMedium: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              titleLarge: const TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ))),
      //home: const CategoriesScreen(), // loading this as our main screen
      // named routes
      routes: {
        '/': (ctx) => const TabsScreen(), //home route
        CategoryMealsScreen.routeName: (ctx) => const CategoryMealsScreen(),
        MealDetailScreen.routeName: (ctx) => const MealDetailScreen(),
        FiltersScreen.routeName: (ctx) => const FiltersScreen(),
      },
      // onGenerateRoute loads specified route for every route not registered in the routes screen as long as we tried to load the named route
      onGenerateRoute: (setteing) {
        print(setteing.arguments);
        //return MaterialPageRoute(builder: (ctx) => const CategoriesScreen(),);
      },
      // onUnknownRoute this route is reched when flutter fials to load any route on the screen
      // (last resort) could be an error page for example
      // for this app we load CategoriesScreen as our fallback page
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (ctx) => const CategoriesScreen(),
        );
      },
    );
  }
}
