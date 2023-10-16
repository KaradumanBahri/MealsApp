 import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
 import 'package:meals/providers/filters_providers.dart';


  class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key, });


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProviter);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),

      body: Column(
          children: [
            SwitchListTile(
              value: activeFilters[Filter.glutenFree]!,
              onChanged: (isChecked) {
                ref.read(filtersProviter.notifier).setFilter(Filter.glutenFree, isChecked);
              },
            title: Text('Gluten-free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
              subtitle: Text('Only include gluten-free meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
              ),
             ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34,right: 22),
            ),
               SwitchListTile(
                 value: activeFilters[Filter.lactoseFree]!,
                 onChanged: (isChecked) {
                   ref.read(filtersProviter.notifier).setFilter(Filter.lactoseFree, isChecked);
              },
              title: Text('Lactose-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              subtitle: Text('Only include lactose-free meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34,right: 22),
            ),
              SwitchListTile(
                value: activeFilters[Filter.vegaterianFree]!,
                onChanged: (isChecked) {
                  ref.read(filtersProviter.notifier).setFilter(Filter.vegaterianFree, isChecked);
              },
              title: Text('Vegaterian-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              subtitle: Text('Only include vegaterian-free meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34,right: 22),
            ),
              SwitchListTile(
                value: activeFilters[Filter.veganFree]!,
                onChanged: (isChecked) {
                  ref.read(filtersProviter.notifier).setFilter(Filter.veganFree, isChecked);
              },
              title: Text('Vegan',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              subtitle: Text('Only include vegan meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34,right: 22),
            ),
          ],
        ),
      );
  }
}

