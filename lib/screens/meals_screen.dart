import 'package:flutter/material.dart';
import 'package:lab_08_dubl3/models/meal_model.dart';
import 'package:lab_08_dubl3/screens/meal_details_screen.dart';
import 'package:lab_08_dubl3/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.meals, required this.title});

  final String title;
  final List<Meal> meals;

  void _selectMeal(BuildContext context, Meal meal) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => MealDetailsScreen(meal: meal),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget body = ListView.builder(
      itemCount: meals.length,
      itemBuilder: (ctx, index) => MealItem(
        meal: meals[index],
        onSelectMeal: () {
          _selectMeal(context, meals[index]);
        },
      ),
    );
    if (meals.isEmpty) {
      body = Center(
        child: Column(
          children: [
            const Text("Uh oh no meals here"),
            const SizedBox(height: 16),
            Text(
              "Try different",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
            ),
          ],
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: body,
    );
  }
}
