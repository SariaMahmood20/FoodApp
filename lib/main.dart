import 'package:flutter/material.dart';
import 'package:food_app/screens/filteredScreen.dart';
import 'package:food_app/screens/mealDetailScreen.dart';
import 'package:food_app/screens/tabsScreen.dart';
import 'screens/categoryMeal.dart';
import './dummyData.dart';
import './Models/meals.dart';

void main()
{
  return runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Map<String, bool> _filters={
    'gluten':false,
    'lactose':false,
    'vegetarian':false,
    'vegan':false
  };

  bool _isMealFavorite(String id)
  {
    return _favoriteMeal.any((meal)=>meal.id==id);
  }

  List <Meal> _availableMeal=DUMMY_MEALS;
  List<Meal> _favoriteMeal=[];

  void setFilters(Map<String, bool> filtersData )
  {
    setState(() {
      _filters=filtersData;
      _availableMeal=DUMMY_MEALS.where((meal)
      {
        if(_filters['gluten']! && !meal.isGlutenFree){
          return false;
        }
        if(_filters['lactose']! && !meal.isLactoseFree){
          return false;
        }
        if(_filters['vegetarian']! && !meal.isVegetarian){
          return false;
        }
        if(_filters['vegan']! && !meal.isVegan){
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorites(String mealId)
  {
    final existingIndex= _favoriteMeal.indexWhere((meal)=> meal.id==mealId);
    if(existingIndex>=0)
      {
        setState(() {
          _favoriteMeal.removeAt(existingIndex);
        });
      }
    else{
      _favoriteMeal.add(DUMMY_MEALS.firstWhere((meal)=> meal.id==mealId));
    }
  }


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
        '/':(context)=>TabScreen(_favoriteMeal),
        CategoryMeal.routeName: (context)=>CategoryMeal(_availableMeal),
        MealDetailScreen.routeName: (context)=> MealDetailScreen(_toggleFavorites, _isMealFavorite),
        FilteredScreen.routeName: (context)=>FilteredScreen(setFilters )
      },
    );
  }
}


