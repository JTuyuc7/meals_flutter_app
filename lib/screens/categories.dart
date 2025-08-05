import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/models/category.dart' as models;
import 'package:meals/widgets/category_grid_item.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key, required this.availableMeals});

  // final void Function(Meal meal) onToggleFavorite;
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
    // You can initialize any state here if needed
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      lowerBound: 0,
      upperBound: 1,
    );
    _animationController.forward(); // Start the animation
  }

  @override
  void dispose() {
    // Dispose of the animation controller to free up resources
    _animationController.dispose();
    super.dispose();
  }

  void _selectCategory(BuildContext context, models.Category category) {
    final filteredMeal = widget.availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MealsScreen(
          title: category.title,
          meals: filteredMeal,
          // onToggleFavorite: onToggleFavorite,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      child: GridView(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.5,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          for (final category in availableCategories)
            CategoryGridItem(
              category: category,
              onNavigateMeal: _selectCategory,
            ),
          // Alternatively, you can use a ListView.builder for dynamic lists
          // ListView.builder(
          //   itemCount: availableCategories.length,
          //   itemBuilder: (context, index) {
          //     return CategoryGridItem(category: availableCategories[index]);
          //   },
          // ),

          // using a map
          // ...availableCategories.map((category) => CategoryGridItem(category: category)).toList(),
        ],
      ),
      //* One option to animate the entrance
      // builder: (context, child) => Padding(
      //   padding: EdgeInsets.only(top: 100 - _animationController.value * 100),
      //   child: child,
      // ),
      //* Second option to animate the entrance
      // builder: (ctx, child) => SlideTransition(
      //   position: Tween<Offset>(
      //     begin: const Offset(0, 1),
      //     end: Offset.zero,
      //   ).animate(CurvedAnimation(
      //     parent: _animationController,
      //     curve: Curves.easeInOut,
      //   )),
      //   child: child,
      // ),
      builder: (ctx, child) => SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 0.3),
          end: Offset.zero,
        ).animate(CurvedAnimation(
          parent: _animationController,
          curve: Curves.easeInOut,
        )),
        child: child,
      ),
    );
  }
}
