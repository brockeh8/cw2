import 'package:flutter/material.dart';
import 'main.dart' show Recipe; 

class DetailsScreen extends StatelessWidget {
  final Recipe recipe;
  const DetailsScreen({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(recipe.title)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text('Ingredients', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 8),
          ...recipe.ingredients.map(
            (ing) => ListTile(dense: true, leading: const Icon(Icons.check), title: Text(ing)),
          ),
          const SizedBox(height: 16),
          Text('Instructions', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 8),
          ...recipe.instructions.asMap().entries.map(
            (e) => ListTile(
              dense: true,
              leading: CircleAvatar(child: Text('${e.key + 1}')),
              title: Text(e.value),
            ),
          ),
        ],
      ),
    );
  }
}
