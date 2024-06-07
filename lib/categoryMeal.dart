import 'package:flutter/material.dart';

class CategoryMeal extends StatelessWidget {
  // CategoryMeal(this.categoryId, this.categoryTitle,{super.key});
  // final String categoryId;
  // final String categoryTitle;
  //

  @override
  Widget build(BuildContext context) {
    final routeArgs= ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryTitle=routeArgs['title'];
    final categoryId=routeArgs['id'];
    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle.toString()),),
      body: Container(
        child: Text('Navigation Successful'),
      ),
    );
  }
}
