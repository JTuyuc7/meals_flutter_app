import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSelectScreen});

  final void Function(String identifier) onSelectScreen;

  Widget buildListTile({
    required String title,
    required IconData icon,
    required void Function() onTap,
    required BuildContext context,
  }) {
    return ListTile(
      leading: Icon(icon, size: 26),
      title: Text(
        title,
        // style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
          fontSize: 24,
          // fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.secondary,
                ],
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.fastfood,
                  size: 48,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                const SizedBox(width: 18),
                Text(
                  'Cooking up',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              ],
            ),
          ),
          // const SizedBox(height: 20),
          Expanded(
            child: ListView(
              children: [
                buildListTile(
                  title: 'Meals',
                  icon: Icons.restaurant,
                  onTap: () {
                    // Navigator.of(context).pushReplacementNamed('/');
                    onSelectScreen('meals');
                  },
                  context: context,
                ),
                buildListTile(
                  title: 'Filters',
                  icon: Icons.settings,
                  onTap: () {
                    // Navigator.of(context).pushReplacementNamed('/filters');
                    onSelectScreen('filters');
                  },
                  context: context,
                ),
              ],
            ),
          ),

          // buildListTile(
          //   title: 'Meals',
          //   icon: Icons.restaurant,
          //   onTap: () {
          //     Navigator.of(context).pushReplacementNamed('/');
          //   },
          // ),
          // buildListTile(
          //   title: 'Filters',
          //   icon: Icons.settings,
          //   onTap: () {
          //     Navigator.of(context).pushReplacementNamed('/filters');
          //   },
          // ),
        ],
      ),
    );
  }
}
