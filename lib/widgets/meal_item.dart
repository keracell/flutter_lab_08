import 'package:flutter/material.dart';
import 'package:lab_08_dubl3/models/meal_model.dart';
import 'package:lab_08_dubl3/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal, required this.onSelectMeal});

  final Meal meal;
  final void Function() onSelectMeal;

  String get complexityText {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  String get affordabilityText {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      clipBehavior: Clip.hardEdge,
      elevation: 4,
      child: InkWell(
        onTap: onSelectMeal,
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              fit: BoxFit.cover,
              height: 150,
              width: double.infinity,
            ),
            Positioned(
              left: 0,
              bottom: 0,
              right: 0,
              child: Container(
                  color: Colors.black54,
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Text(
                        meal.title,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MealItemTrait(
                            label: '${meal.duration} min',
                            icon: Icons.schedule,
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          MealItemTrait(
                            label: complexityText,
                            icon: Icons.work,
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          MealItemTrait(
                            label: affordabilityText,
                            icon: Icons.attach_money,
                          ),
                        ],
                      )
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
