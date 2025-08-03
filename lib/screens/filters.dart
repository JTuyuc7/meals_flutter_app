import 'package:flutter/material.dart';
// import 'package:meals/screens/drawer.dart';
// import 'package:meals/screens/tabs.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key, required this.initialFilters});

  final Map<Filter, bool> initialFilters;

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFreeFilterState = false;
  var _lactoseFreeFilterState = false;
  var _vegetarianFilterState = false;
  var _veganFilterState = false;

  @override
  void initState() {
    super.initState();
    _glutenFreeFilterState = widget.initialFilters[Filter.glutenFree]!;
    _lactoseFreeFilterState = widget.initialFilters[Filter.lactoseFree]!;
    _vegetarianFilterState = widget.initialFilters[Filter.vegetarian]!;
    _veganFilterState = widget.initialFilters[Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
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
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (bool didPop, dynamic result) {
          if (didPop) return;
          Navigator.of(context).pop({
            Filter.glutenFree: _glutenFreeFilterState,
            Filter.lactoseFree: _lactoseFreeFilterState,
            Filter.vegetarian: _vegetarianFilterState,
            Filter.vegan: _veganFilterState,
          });
        },
        child: Column(
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
              value: _glutenFreeFilterState,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
              onChanged: (isChecked) {
                setState(() {
                  _glutenFreeFilterState = isChecked;
                });
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
              value: _lactoseFreeFilterState,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
              onChanged: (isChecked) {
                setState(() {
                  _lactoseFreeFilterState = isChecked;
                });
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
              value: _vegetarianFilterState,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
              onChanged: (isChecked) {
                setState(() {
                  _vegetarianFilterState = isChecked;
                });
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
              value: _veganFilterState,
              onChanged: (isChecked) {
                setState(() {
                  _veganFilterState = isChecked;
                });
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
