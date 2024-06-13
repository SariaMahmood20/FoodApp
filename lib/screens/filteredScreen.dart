import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_app/widgets/mainDrawer.dart';

class FilteredScreen extends StatefulWidget {
  FilteredScreen(this.saveFilters);

  static const routeName='/filters';

  final Function saveFilters;

  @override
  State<FilteredScreen> createState() => _FilteredScreenState();
}

class _FilteredScreenState extends State<FilteredScreen> {



  bool _glutenFree=false;
  bool vegetarian=false;
  bool Vegan=false;
  bool isLactoseFree=false;






Widget buildSwitch(String text, String description, bool value, setstate)
{
  return SwitchListTile(
      title: Text(text),
      value: value,
      subtitle: Text(description) ,
      onChanged: setstate,
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Filtered'),
          actions: <Widget>[
            IconButton(onPressed:() {
              final selectedFilters={
                'gluten':_glutenFree,
                'lactose':isLactoseFree,
                'vegetarian':vegetarian,
                'vegan':Vegan
              };
              widget.saveFilters(selectedFilters);
            }, icon: Icon(Icons.save))
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust your meal selection.',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Expanded(
                child:
                ListView(
                  children: [
                    buildSwitch('Gluten Free', 'Only include Gluten Free meals',_glutenFree, (newValue){setState(() {
                      _glutenFree=newValue;
                    });}),
                    buildSwitch('Lactose Free', 'Only include Lactose Free meals',isLactoseFree, (newValue){setState(() {
                      isLactoseFree=newValue;
                    });}),
                    buildSwitch('Vegetarian', 'Only include Vegetarian meals',vegetarian, (newValue){setState(() {
                      vegetarian=newValue;
                    });}),
                    buildSwitch('Vegan', 'Only includes Vegan meals',Vegan, (newValue){setState(() {
                      Vegan=newValue;
                    });})

            ],))
          ],
        ));
  }
}
