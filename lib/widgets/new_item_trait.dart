

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class MealItemTrait extends StatelessWidget {
    final IconData icon;
  final String label;
  const MealItemTrait({ super.key, 
    required this.icon, 
    required this.label,
  });


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 16, color: Colors.white),
        const SizedBox(width: 4),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}