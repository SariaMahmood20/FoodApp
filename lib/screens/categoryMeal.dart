import 'package:flutter/material.dart';
import 'package:food_app/widgets/mealItem.dart';
import '../dummyData.dart';

class CategoryMeal extends StatelessWidget {
  static const routeName='/categoryMeal';
  // CategoryMeal(this.categoryId, this.categoryTitle,{super.key});
  // final String categoryId;
  // final String categoryTitle;
  //

  @override
  Widget build(BuildContext context) {
    final routeArgs= ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryTitle=routeArgs['title'];
    final categoryId=routeArgs['id'];
    final filteredMeals=DUMMY_MEALS.where((meal)
    {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle.toString()),),
      body: ListView.builder(itemBuilder: (ctx, index){
        return MealItem(filteredMeals[index].id,filteredMeals[index].title, filteredMeals[index].affordability, filteredMeals[index].complexity, filteredMeals[index].duration, filteredMeals[index].imageUrl);
      },
      itemCount: filteredMeals.length,),
    );
  }
}