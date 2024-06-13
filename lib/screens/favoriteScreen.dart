import 'package:flutter/material.dart';
import '../Models/meals.dart';
import '../widgets/mealItem.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen(this.favoriteMeals,{super.key});

  final List<Meal> favoriteMeals;

  @override
  Widget build(BuildContext context) {
    if(favoriteMeals.isEmpty){
      return Center(
        child: Text('You have no favorites - start adding some!'),
      );
    }else{
      return ListView.builder(itemBuilder: (ctx, index){
        return MealItem(favoriteMeals[index].id,favoriteMeals[index].title, favoriteMeals[index].affordability, favoriteMeals[index].complexity, favoriteMeals[index].duration, favoriteMeals[index].imageUrl);
      },
        itemCount: favoriteMeals.length,);
    }

  }
}
