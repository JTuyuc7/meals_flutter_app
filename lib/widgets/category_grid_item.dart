import 'package:flutter/material.dart';

import 'package:meals/models/category.dart';

class CategoryGridItem extends StatelessWidget {
  final Category category;
  final void Function(BuildContext context, Category category) onNavigateMeal;

  const CategoryGridItem({super.key, required this.category, required this.onNavigateMeal});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onNavigateMeal(context, category);
      },
      splashColor: Theme.of(context).colorScheme.primary.withValues(alpha: 0.5),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: category.color,
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            colors: [
              category.color.withValues(alpha: 0.55),
              category.color.withValues(alpha: 0.95),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Text(
            category.title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
