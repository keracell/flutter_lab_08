import 'package:flutter/material.dart';
import 'package:lab_08_dubl3/models/category_model.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem(
      {super.key, required this.category, required this.onSelect});

  final Category category;
  final void Function() onSelect;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onSelect();
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.5),
              category.color.withOpacity(0.9)
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(),
        ),
      ),
    );
  }
}
