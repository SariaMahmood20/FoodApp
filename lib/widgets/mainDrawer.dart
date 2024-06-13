import 'package:flutter/material.dart';
import 'package:food_app/screens/categoriesScreen.dart';
import 'package:food_app/screens/filteredScreen.dart';
import 'package:food_app/screens/tabsScreen.dart';

class MainDrawer extends StatelessWidget {
  MainDrawer({super.key});

  Widget buildListTile(String text, IconData icon, func)
  {
    return ListTile(
      leading: Icon(icon, size: 26,),
      title: Text(
        text,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),),
      onTap: func

      ,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            color: Theme.of(context).canvasColor,
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: Text(
              'Cooking Up',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).primaryColor
              ),
            ),
          ),
          const SizedBox(height: 20,),
          buildListTile('Meals', Icons.restaurant_menu, (){
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildListTile('Filters', Icons.filter_alt, (){
            Navigator.of(context).pushReplacementNamed(FilteredScreen.routeName);})
        ],
      ),
    );
  }
}
