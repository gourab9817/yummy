import 'package:flutter/material.dart';
import 'package:yummy/core/theme/app_colors.dart';

class RecipePopup extends StatelessWidget {
  final String recipeTitle;
  final String recipeImage;
  final List<String> actions;

  const RecipePopup({
    Key? key,
    required this.recipeTitle,
    required this.recipeImage,
    this.actions = const ['Cancel', 'View Recipe', 'Add to Favorites'],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              recipeImage,
              height: 120,
              width: 120,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            recipeTitle,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
          ...actions.map((action) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, action);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: action == 'Cancel'
                        ? AppColors.secondaryLight
                        : AppColors.primary,
                    foregroundColor: action == 'Cancel'
                        ? AppColors.primary
                        : AppColors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(action),
                ),
              )),
        ],
      ),
    );
  }
} 