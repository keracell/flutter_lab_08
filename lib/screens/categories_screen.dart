import 'package:flutter/material.dart';
import 'package:lab_08_dubl3/data/dummy_data.dart';
import 'package:lab_08_dubl3/models/category_model.dart';
import 'package:lab_08_dubl3/screens/meals_screen.dart';
import 'package:lab_08_dubl3/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.categories});

  final List<Category> categories;

  void _selectCategory(BuildContext context, Category category) {
    final meals = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (ctx) =>
                MealsScreen(meals: meals, title: category.title)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
      ),
      body: GridView(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: categories
            .map((category) => CategoryGridItem(
                  category: category,
                  onSelect: () => _selectCategory(context, category),
                ))
            .toList(),
      ),
    );
  }
}
