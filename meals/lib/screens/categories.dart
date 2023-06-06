import 'package:flutter/material.dart';

import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/category.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/meals.dart';

import 'package:meals/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({
    super.key,
    required this.onToggleFavorite,
    required this.availebleMeals,
  });

  final void Function(Meal meal) onToggleFavorite;
  final List<Meal> availebleMeals; 

  void _selectCategory(BuildContext context, Category category) {
    List<Meal> filteredeals = availebleMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => MealsScreen(
        title: category.title,
        meals: filteredeals,
        onToggleFavorite: onToggleFavorite,
      ),
    ));
  }

  @override
  Widget build(context) {
    return GridView(
      padding: const EdgeInsets.all(22),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.5,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        for (final category in availableCategories)
          CategoryGridItem(
            category: category,
            onSelectCategory: () {
              _selectCategory(context, category);
            },
          ),
      ],
    );
  }
}
