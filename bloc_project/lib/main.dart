import 'package:bloc_project/features/recipies/bloc/bloc/recipe_bloc_bloc.dart';
import 'package:bloc_project/services/setup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

void main() {
  setup();
  runApp(BlocProvider(create: (context) => RecipeBlocBloc(), child: MainApp()));
}

class MainApp extends StatelessWidget {
  GoRouter router = GetIt.I<GoRouter>();
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
