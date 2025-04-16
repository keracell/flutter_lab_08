import 'package:flutter/material.dart';
import 'package:lab_08_dubl3/models/category_model.dart';
import 'package:lab_08_dubl3/models/meal_model.dart';
import 'package:lab_08_dubl3/screens/meals_screen.dart';
import 'package:lab_08_dubl3/widgets/category_grid_item.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen(
      {super.key, required this.categories, required this.availableMeals});

  final List<Category> categories;
  final List<Meal> availableMeals;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
      lowerBound: 0,
      upperBound: 1,
    );

    _animationController.forward();
  }

  void _selectCategory(BuildContext context, Category category) {
    final meals = widget.availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (ctx) => MealsScreen(
            meals: meals,
            title: category.title,
          ),
        ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animationController,
        child: GridView(
          padding: const EdgeInsets.all(24),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          children: widget.categories
              .map((category) => CategoryGridItem(
                    category: category,
                    onSelect: () => _selectCategory(context, category),
                  ))
              .toList(),
        ),
        builder: (context, child) {
          return SlideTransition(
            position: Tween(
              begin: const Offset(0, 0.3),
              end: const Offset(0, 0),
            ).animate(CurvedAnimation(
                parent: _animationController, curve: Curves.easeInCirc)),
            child: child,
          );
        });
  }
}
