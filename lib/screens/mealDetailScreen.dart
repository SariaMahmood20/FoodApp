import 'package:flutter/material.dart';
import '../dummyData.dart';

class MealDetailScreen extends StatelessWidget {
  MealDetailScreen(this.toggleFavorite,this.isMealFavorite,{super.key});
  static const routeName = '/meal-detail';

  final Function toggleFavorite;
  final Function isMealFavorite;

  Widget buildSectionTitle(BuildContext context, String text)
  {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(text, style: Theme.of(context).textTheme.titleMedium,),
    );
  }

  Widget buildContainer(Widget child)
  {
    return Container(
        height: 200,
        width: 300,
        decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 2, color: Colors.grey),
    borderRadius: BorderRadius.circular(15),
    ),
    margin: EdgeInsets.all(10),
    padding: EdgeInsets.all(10),
    child: child);
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments as String;
    final selectedMeal=DUMMY_MEALS.firstWhere((meal)=> meal.id == mealId);
    return Scaffold(
        appBar: AppBar(title: Text(selectedMeal.title),),
        body:
        SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 300,
                width: double.infinity,
                child: Image.network(selectedMeal.imageUrl,
                fit: BoxFit.cover,
                )
              ),
              buildSectionTitle(context,'Ingredients'),
              buildContainer(
                ListView.builder(
                  itemBuilder: (context, index) => Card(
                    color: Theme.of(context).primaryColorLight,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                      child: Text(selectedMeal.ingredients[index]),
                    ),
                  ),
                  itemCount: selectedMeal.ingredients.length,
                ),
              ),
              buildSectionTitle(context, 'Steps'),
              buildContainer(
                ListView.builder(
                  itemBuilder: (context, index)=> Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(child: Text('#'+(index+1).toString()),),
                        title: Text(selectedMeal.steps[index]),
                      ),Divider(),
                    ],
                  ),
                  itemCount: selectedMeal.steps.length,
                ),
              )
            ],
          ),
        ),
        floatingActionButton:
          FloatingActionButton(
            onPressed: ()=> toggleFavorite(mealId),
            child: Icon(
                isMealFavorite(mealId)?Icons.favorite:Icons.favorite_border_outlined
            ),
            
          ),
    );
  }
}
