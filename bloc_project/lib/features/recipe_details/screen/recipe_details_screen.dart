import 'package:bloc_project/features/recipies/bloc/bloc/recipe_bloc_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RecipeDetailsScreen extends StatelessWidget {
  const RecipeDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipeBlocBloc, RecipeBlocState>(
      builder: (context, state) {
        if (state is ShowDetailsState) {
          final recipe = state.recipes[state.index];

          return Scaffold(
            appBar: AppBar(
              leading: BackButton(onPressed: () => context.go('/')),
              title: const Text('Recipe details'),
              centerTitle: true,
            ),
            body: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: const Text(
                            'Title',
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                          subtitle: Text(recipe.title),
                          leading: const Icon(Icons.article_outlined),
                        ),
                        const Divider(),
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: const Text(
                            'Description',
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                          subtitle: Text(recipe.description),
                          leading: const Icon(Icons.description_outlined),
                        ),
                        const Divider(),
                        Row(
                          children: [
                            const Icon(Icons.category_outlined),
                            const SizedBox(width: 12),
                            const Text(
                              'Category',
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                            const SizedBox(width: 12),
                            Chip(
                              label: Text(recipe.category.name),
                              backgroundColor: Colors.blue,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ExpansionTile(
                    leading: const Icon(Icons.format_list_numbered),
                    title: const Text(
                      'Steps',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    childrenPadding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                    children: recipe.steps
                        .map(
                          (e) => ListTile(
                            leading: const Icon(Icons.format_list_numbered),

                            dense: true,
                            title: Text(e),
                          ),
                        )
                        .toList(),
                  ),
                ),
                const SizedBox(height: 12),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ExpansionTile(
                    leading: const Icon(Icons.cookie_outlined),

                    title: const Text(
                      'Ingredients',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    childrenPadding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                    children: recipe.ingredients
                        .map(
                          (e) => ListTile(
                            dense: true,
                            leading: const Icon(Icons.cookie_outlined),
                            title: Text(e),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
            ),
          );
        }

        return Scaffold(
          appBar: AppBar(
            leading: BackButton(onPressed: () => context.go('/')),
            title: const Text('Recipe details'),
            centerTitle: true,
          ),
          body: const Center(child: Text('Nothing to show')),
        );
      },
    );
  }
}
