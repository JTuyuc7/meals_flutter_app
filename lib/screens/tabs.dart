import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/drawer.dart';
import 'package:meals/screens/filters.dart';
import 'package:meals/screens/meals.dart';

const kInitialFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false,
};

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;
  final List<Meal> _favoriteMeals = [];
  Map<Filter, bool> _selectedFilters = kInitialFilters;

  void _toggleMealFavoriteStatus(Meal meal) {
    final isExisting = _favoriteMeals.contains(meal);

    void showInfoMessage(String message) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message), duration: const Duration(seconds: 2)),
      );
    }

    if (isExisting) {
      setState(() {
        _favoriteMeals.remove(meal);
      });
      showInfoMessage('Removed from favorites');
    } else {
      setState(() {
        _favoriteMeals.add(meal);
      });
      showInfoMessage('Added to favorites');
    }
  }

  void _selectScreen(String identifier) async {
     Navigator.of(context).pop(); // Close the drawer
    if (identifier == 'filters') {
      // Navigator.of(context).pushReplacementNamed('filters'); // One way to navigate
      final results = await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (context) => FiltersScreen(
            initialFilters: _selectedFilters,
          ),
        ),
      );
      // Navigator.of(context).pushReplacement(
      //   MaterialPageRoute(
      //     builder: (context) => const FiltersScreen(),
      //   ),
      // );
      if (results == null) return;
      setState(() {
        // Update the filters based on the results
        // _selectedFilters = results ?? kInitialFilters;
        _selectedFilters = results;
      });
    }
      
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    final availableMeals = dummyMeals.where((meal) {
      if (_selectedFilters[Filter.glutenFree]! && !meal.isGlutenFree) return false;
      if (_selectedFilters[Filter.lactoseFree]! && !meal.isLactoseFree) return false;
      if (_selectedFilters[Filter.vegetarian]! && !meal.isVegetarian) return false;
      if (_selectedFilters[Filter.vegan]! && !meal.isVegan) return false;
      return true;
    }).toList();

    Widget activePage = CategoriesScreen(
      onToggleFavorite: _toggleMealFavoriteStatus,
      availableMeals: availableMeals,
    );
    var activePageTitle = 'Categories';

    if (_selectedPageIndex == 1) {
      activePage = MealsScreen(
        meals: _favoriteMeals,
        onToggleFavorite: _toggleMealFavoriteStatus,
      );
      activePageTitle = 'Your Favorite Meals';
    }

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(activePageTitle),
          // bottom: const TabBar(
          //   tabs: [
          //     Tab(icon: Icon(Icons.category), text: 'Categories'),
          //     Tab(icon: Icon(Icons.star), text: 'Favorites'),
          //   ],
          // ),
        ),
        body: activePage,
        drawer: MainDrawer(onSelectScreen: _selectScreen),
        bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          currentIndex: _selectedPageIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.set_meal),
              label: 'Categories',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
          ],
        ),
      ),
    );
  }
}
