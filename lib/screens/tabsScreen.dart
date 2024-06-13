import 'package:flutter/material.dart';
import 'package:food_app/screens/categoriesScreen.dart';
import 'package:food_app/screens/favoriteScreen.dart';
import 'package:food_app/widgets/mainDrawer.dart';
import '../Models/meals.dart';

class TabScreen extends StatefulWidget {
  const TabScreen(this.favoriteMeals,{super.key});

  final List<Meal> favoriteMeals;

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {


  @override


  Widget build(BuildContext context) {
    return DefaultTabController(

      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          foregroundColor: Theme.of(context).primaryColorLight,
          title:const Text(
            'Meals',
            style: TextStyle(color: Colors.white),
          ),
          bottom: const TabBar(tabs:<Widget>[
            Tab(
              icon: Icon(Icons.category_sharp, color: Colors.white,),
              child: Text("Categories", style: TextStyle(color: Colors.white),),
            ),
            Tab(
              icon: Icon(Icons.favorite, color: Colors.white,),
              child: Text("Favorites", style: TextStyle(color: Colors.white),),
            ),
          ]),
        ),
        body: TabBarView(children: <Widget>[
          CategoriesScreen(),
          FavoriteScreen(widget.favoriteMeals),
        ]),
        drawer: MainDrawer(),
      ),
    );
  }
}
