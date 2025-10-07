import 'package:flutter/material.dart';
import 'details_screen.dart';

void main() => runApp(const RecipeApp());

class Recipe {
  final String title;
  final List<String> ingredients;
  final List<String> instructions;
  const Recipe(this.title, this.ingredients, this.instructions);
}

const recipes = <Recipe>[
  Recipe(
    'Spaghetti',
    ['Spaghetti','Salt', 'Seasonings'],
    ['Boil spaghetti', 'salt water', 'Add seasonings', 'plate'],
  ),
  Recipe(
    'Chicken Tacos',
    ['Chicken', 'Taco shells', 'Salsa', 'Sour cream'],
    ['Cook chicken', 'Warm shells', 'Assemble with toppings', 'serve'],
  ),
  Recipe(
    'Pancakes',
    ['Flour', 'Milk', 'Eggs', 'Sugar', 'Baking powder', 'Butter', 'Salt'],
    ['Mix dry + wet', 'Pour on pan', 'Flip', 'serve'],
  ),
];

class RecipeApp extends StatelessWidget {
  const RecipeApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe Book',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.teal),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Recipes')),
      body: ListView.separated(
        itemCount: recipes.length,
        separatorBuilder: (_, __) => const Divider(height: 0),
        itemBuilder: (context, i) {
          final r = recipes[i];
          return ListTile(
            title: Text(r.title),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => Navigator.push(
              context,
              //adv
              //MaterialPageRoute(builder: (_) => DetailsScreen(recipe: r)),
            ),
          );
        },
      ),
    );
  }
}
