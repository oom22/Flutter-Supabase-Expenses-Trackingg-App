import 'package:bloc_project/features/add_recipe/screen/add_recipe_screen.dart';
import 'package:bloc_project/features/recipe_details/screen/recipe_details_screen.dart';
import 'package:bloc_project/features/recipies/bloc/bloc/recipe_bloc_bloc.dart';
import 'package:bloc_project/features/recipies/screen/recipies_screen.dart';
import 'package:bloc_project/models/recipe_model.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

void setup() {
  GetIt.I.registerSingleton<RecipeBlocBloc>(RecipeBlocBloc());
  GetIt.I.registerSingleton<GoRouter>(
    GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (BuildContext context, GoRouterState state) {
            return RecipiesScreen();
          },
        ),
        GoRoute(
          path: '/details',
          builder: (BuildContext context, GoRouterState state) {
            return RecipeDetailsScreen();
          },
        ),
        GoRoute(
          path: '/add',
          builder: (BuildContext context, GoRouterState state) {
            return AddRecipeScreen(
              categories: [
                CategoryType.breakfast,
                CategoryType.launch,
                CategoryType.dinner,
                CategoryType.other,
              ],
            );
          },
        ),
      ],
    ),
  );
}
