import 'package:flutter/material.dart';
import 'package:lab_08_dubl3/providers/filters_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentFilter = ref.watch(filtersProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: Column(
        children: [
          SwitchListTile(
            value: currentFilter[Filter.glutenFree]!,
            title: Text(
              'Gluten free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
            subtitle: Text(
              'Only include gluten-gree meals.',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 16, right: 32),
            onChanged: (val) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.glutenFree, val);
            },
          ),
          SwitchListTile(
            value: currentFilter[Filter.lactoseFree]!,
            title: Text(
              'Lactose free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
            subtitle: Text(
              'Only include lactose-gree meals.',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 16, right: 32),
            onChanged: (val) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.lactoseFree, val);
            },
          ),
          SwitchListTile(
            value: currentFilter[Filter.vegetarian]!,
            title: Text(
              'Vegeterian',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
            subtitle: Text(
              'Only include vegeterian meals.',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 16, right: 32),
            onChanged: (val) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.vegetarian, val);
            },
          ),
          SwitchListTile(
            value: currentFilter[Filter.vegan]!,
            title: Text(
              'Vegan',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
            subtitle: Text(
              'Only include vegan meals.',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 16, right: 32),
            onChanged: (val) {
              ref.read(filtersProvider.notifier).setFilter(Filter.vegan, val);
            },
          ),
        ],
      ),
    );
  }
}

// PopScope(
//   canPop: false,
//   onPopInvokedWithResult: (bool didPop, dynamic result) {
//     if(didPop) return;
//       Navigator.of(context).pop({
//         Filter.glutenFree: _glutenFreeFilterSet,
//         Filter.lactoseFree: _lactoseFreeFilterSet,
//         Filter.vegetarian: _vegetarianFilterSet,
//         Filter.vegan: _veganFilterSet,
//       });
//     },
//     child: Column(...) // same code as shown in the next lecture
// ),
