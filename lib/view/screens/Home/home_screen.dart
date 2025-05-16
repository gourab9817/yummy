// lib/view/screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:yummy/core/theme/app_colors.dart';
import 'package:yummy/view/screens/Home/recipe_popup.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final List<Map<String, String>> _popularRecipes = [
    {
      'title': 'Friedrice cake',
      'image': 'assets/images/food1.png',
    },
    {
      'title': 'Classic Victoria',
      'image': 'assets/images/food2.png',
    },
    {
      'title': 'Pasta and Ricotta',
      'image': 'assets/images/food3.png',
    },
  ];
  final List<Map<String, String>> _latestRecipes = [
    {
      'title': 'Classic Victoria',
      'image': 'assets/images/food2.png',
    },
    {
      'title': 'Pasta and Ricotta',
      'image': 'assets/images/food3.png',
    },
    {
      'title': 'Friedrice cake',
      'image': 'assets/images/food1.png',
    },
  ];

  void _showRecipePopup(Map<String, String> recipe) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) => RecipePopup(
        recipeTitle: recipe['title']!,
        recipeImage: recipe['image']!,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Yummy'),
        backgroundColor: AppColors.primary,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Popular Recipes',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 180,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: _popularRecipes.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 16),
                  itemBuilder: (context, index) {
                    final recipe = _popularRecipes[index];
                    return GestureDetector(
                      onTap: () => _showRecipePopup(recipe),
                      child: _RecipeCard(
                        title: recipe['title']!,
                        image: recipe['image']!,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'The Latest Recipes',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _latestRecipes.length,
                separatorBuilder: (_, __) => const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  final recipe = _latestRecipes[index];
                  return GestureDetector(
                    onTap: () => _showRecipePopup(recipe),
                    child: _RecipeCard(
                      title: recipe['title']!,
                      image: recipe['image']!,
                      horizontal: true,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.primaryLight,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class _RecipeCard extends StatelessWidget {
  final String title;
  final String image;
  final bool horizontal;

  const _RecipeCard({
    Key? key,
    required this.title,
    required this.image,
    this.horizontal = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: horizontal ? double.infinity : 140,
      height: horizontal ? 80 : 160,
      decoration: BoxDecoration(
        color: AppColors.primaryLight,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              image,
              width: horizontal ? 80 : 140,
              height: horizontal ? 80 : 140,
              fit: BoxFit.cover,
            ),
          ),
          if (horizontal)
            const SizedBox(width: 12),
          if (horizontal)
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          if (!horizontal)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
        ],
      ),
    );
  }
}