import 'package:bloc_project/features/recipies/bloc/bloc/recipe_bloc_bloc.dart';
import 'package:bloc_project/models/recipe_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RecipiesScreen extends StatelessWidget {
  const RecipiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RecipeBlocBloc, RecipeBlocState>(
      listener: (context, state) {
        if (state is GoToAddState) {
          context.go('/add');
        }
      },
      child: Builder(
        builder: (context) {
          final bloc = context.read<RecipeBlocBloc>();

          return Scaffold(
            body: SafeArea(
              child: CustomScrollView(
                controller: bloc.controller,
                slivers: [
                  SliverAppBar(
                    expandedHeight: 200,
                    pinned: true,
                    backgroundColor: bloc.isScrolled
                        ? Colors.red
                        : Colors.amber,
                    flexibleSpace: FlexibleSpaceBar(
                      title: Center(
                        child: bloc.isScrolled
                            ? null
                            : ElevatedButton(
                                onPressed: () {
                                  bloc.add(GoToAddPageEvent());
                                },
                                child: const Text("add a recipe"),
                              ),
                      ),
                      expandedTitleScale: 1,
                      centerTitle: true,
                    ),
                  ),

                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 12.0,
                      ),
                      child: Row(
                        children: [
                          const Text(
                            "Filter:",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(width: 12),

                          BlocBuilder<RecipeBlocBloc, RecipeBlocState>(
                            buildWhen: (state, next) {
                              final p = (state is FilteringState)
                                  ? state.activeCategory
                                  : null;
                              final n = (next is FilteringState)
                                  ? next.activeCategory
                                  : null;
                              return p != n;
                            },
                            builder: (context, state) {
                              final categories = collectCategories(
                                state.recipes,
                              );

                              final CategoryType? active =
                                  (state is FilteringState)
                                  ? state.activeCategory
                                  : null;

                              return DropdownButton<CategoryType?>(
                                hint: const Text("All categories"),
                                value: active,
                                items: <DropdownMenuItem<CategoryType?>>[
                                  //نطلع خانة للكل
                                  const DropdownMenuItem<CategoryType?>(
                                    value: null,
                                    child: Text("All"),
                                  ),

                                  ...categories.map(
                                    (value) => DropdownMenuItem<CategoryType?>(
                                      value: value,
                                      child: Text(value.name),
                                    ),
                                  ),
                                ],
                                onChanged: (categoryy) {
                                  context.read<RecipeBlocBloc>().add(
                                    FilterRecipiesEvent(categoryy),
                                  );
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),

                  BlocBuilder<RecipeBlocBloc, RecipeBlocState>(
                    builder: (context, state) {
                      return SliverList(
                        delegate: SliverChildBuilderDelegate(
                          childCount: state.recipes.length,
                          (context, index) => ListTile(
                            title: Text(state.recipes[index].title),
                            subtitle: Text(state.recipes[index].description),
                            onTap: () {
                              bloc.add(ShowRecipeEvent(indexo: index));
                              context.go('/details');
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  List<CategoryType> collectCategories(List<RecipeModel> items) {
    final set = <CategoryType>{};
    for (final recipie in items) {
      set.add(recipie.category);
    }
    return set.toList();
  }
}
