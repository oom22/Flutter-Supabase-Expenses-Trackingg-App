import 'package:bloc_project/features/add_recipe/screen/add_recipe_screen.dart';
import 'package:bloc_project/features/recipe_details/screen/recipe_details_screen.dart';
import 'package:bloc_project/features/recipies/bloc/bloc/recipe_bloc_bloc.dart';
import 'package:bloc_project/features/recipies/screen/recipies_screen.dart';
import 'package:bloc_project/models/recipe_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

void setup() {
  // Register singletons once
  GetIt.I.registerSingleton<RecipeBlocBloc>(RecipeBlocBloc());

  GetIt.I.registerSingleton<GoRouter>(
    GoRouter(
      routes: [
        GoRoute(path: '/', builder: (context, state) => const RecipiesScreen()),
        GoRoute(
          path: '/details',
          builder: (context, state) => const RecipeDetailsScreen(),
        ),
        GoRoute(
          path: '/add',
          builder: (context, state) => AddRecipeScreen(
            categories: const [
              CategoryType.breakfast,
              CategoryType.launch,
              CategoryType.dinner,
              CategoryType.other,
            ],
          ),
        ),
      ],
    ),
  );
}

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    final router = GetIt.I<GoRouter>();
    final recipeBloc = GetIt.I<RecipeBlocBloc>();

    return BlocProvider.value(
      value: recipeBloc,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: router,
      ),
    );
  }
}
