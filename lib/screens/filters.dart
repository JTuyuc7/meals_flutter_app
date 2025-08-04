import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/filters_provider.dart';
// import 'package:meals/screens/drawer.dart';
// import 'package:meals/screens/tabs.dart';

enum Filter { glutenFree, lactoseFree, vegetarian, vegan }

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({
    super.key, 
    // required this.initialFilters
    });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Filters')),
      // drawer: MainDrawer(onSelectScreen: (identifier){
      //   Navigator.of(context).pop(); // Close the drawer
      //   if (identifier == 'meals') {
      //     // Navigator.of(context).push(
      //     //   MaterialPageRoute(
      //     //     builder: (context) => const TabsScreen(),
      //     //   ),
      //     // );
      //     Navigator.of(context).pushReplacement(
      //       MaterialPageRoute(
      //         builder: (context) => const TabsScreen(),
      //       ),
      //     );
      //   }
      // }),
      body: Column(
          children: [
            SwitchListTile(
              title: Text(
                'Gluten-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              subtitle: Text(
                'Only include gluten-free meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurface.withValues(alpha: 0.7),
                ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              value: activeFilters[Filter.glutenFree]!,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
              onChanged: (isChecked) {
                ref.read(filtersProvider.notifier).setFilter(Filter.glutenFree, isChecked);
              },
            ),
            SwitchListTile(
              title: Text(
                'Lactose-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              subtitle: Text(
                'Only include lactose-free meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurface.withValues(alpha: 0.7),
                ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              value: activeFilters[Filter.lactoseFree]!,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
              onChanged: (isChecked) {
                ref.read(filtersProvider.notifier).setFilter(Filter.lactoseFree, isChecked);
              },
            ),
            SwitchListTile(
              title: Text(
                'Vegetarian',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              subtitle: Text(
                'Only include vegetarian meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurface.withValues(alpha: 0.7),
                ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              value: activeFilters[Filter.vegetarian]!,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
              onChanged: (isChecked) {
                ref.read(filtersProvider.notifier).setFilter(Filter.vegetarian, isChecked);
              },
            ),
            SwitchListTile(
              title: Text(
                'Vegan',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              subtitle: Text(
                'Only include vegan meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurface.withValues(alpha: 0.7),
                ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
              // value: _veganFilterState, // Uncomment if you want to use this filter
              value: activeFilters[Filter.vegan]!,
              onChanged: (isChecked) {
                ref.read(filtersProvider.notifier).setFilter(Filter.vegan, isChecked);
              },
            ),
            // SwitchListTile(
            //   title: const Text('Vegan'),
            //   value: _veganFilterState,
            //   onChanged: (isChecked) {
            //     setState(() {
            //       _veganFilterState = isChecked;
            //     });
            //   },
            // ),
          ],
        ),
      
    );
  }
}

/*

PopScope(
  canPop: false,
  onPopInvokedWithResult: (bool didPop, dynamic result) {
    if(didPop) return;
      Navigator.of(context).pop({
        Filter.glutenFree: _glutenFreeFilterSet,
        Filter.lactoseFree: _lactoseFreeFilterSet,
        Filter.vegetarian: _vegetarianFilterSet,
        Filter.vegan: _veganFilterSet,
      });
    },
    child: Column(...) // same code as shown in the next lecture
)
*/
