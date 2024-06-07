import 'package:flutter/material.dart';
import './categoryMeal.dart';
import './categoriesScreen.dart';

void main()
{
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.pink,

        canvasColor: Color.fromRGBO(189, 189, 189, 0.7),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyLarge: TextStyle(
            color: Color.fromRGBO(49, 49, 49, 1)
          ),
          bodyMedium: TextStyle(
            color: Color.fromRGBO(49, 49, 49, 1)
          ),
          titleMedium: TextStyle(
            fontSize: 20,
            fontFamily: 'RobotoCondensed'
          )
        )
      ),
      // home: CategoriesScreen(),
      routes: {
        '/':(context)=>CategoriesScreen(),
        CategoryMeal.routeName: (context)=>CategoryMeal(),
      },
    );
  }
}


