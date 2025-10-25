import 'package:bloc_project/common/widgets/custom_field.dart';
import 'package:bloc_project/features/recipies/bloc/bloc/recipe_bloc_bloc.dart';
import 'package:bloc_project/models/recipe_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class AddRecipeScreen extends StatelessWidget {
  AddRecipeScreen({required this.categories, super.key});

  CategoryType? itemCategory;
  List<CategoryType> categories;
  Function(String)? onChanged;
  List<String> ingredients = [''];
  List<String> steps = [''];

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final bloc = context.read<RecipeBlocBloc>();
        return Scaffold(
          appBar: AppBar(leading: BackButton(onPressed: () => context.go('/'))),
          body: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomField(
                  controller: bloc.titleController,
                  hint: "Title",
                  label: "Title",
                ),
                CustomField(
                  controller: bloc.descreptionController,
                  hint: "Descreption",
                  label: "Descreption",
                ),

                Row(
                  children: [
                    SizedBox(
                      width: 230,
                      child: CustomField(
                        controller: bloc.ingredientController,
                        hint: "Ingredient",
                        label: "Ingredient",
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        ingredients.add(bloc.ingredientController.text);
                        bloc.ingredientController.clear();
                      },
                      child: const Text("Add ingredient"),
                    ),
                  ],
                ),

                Row(
                  children: [
                    SizedBox(
                      width: 230,
                      child: CustomField(
                        maxLength: 300,
                        controller: bloc.stepController,
                        hint: "Step",
                        label: "Step",
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        steps.add(bloc.stepController.text);
                        bloc.stepController.clear();
                      },
                      child: const Text("Add Step"),
                    ),
                  ],
                ),

                BlocBuilder<RecipeBlocBloc, RecipeBlocState>(
                  buildWhen: (prev, next) {
                    final p = (prev is CategorySelectionState)
                        ? prev.selected
                        : null;
                    final n = (next is CategorySelectionState)
                        ? next.selected
                        : null;
                    return p != n;
                  },
                  builder: (context, state) {
                    final selected = (state is CategorySelectionState)
                        ? state.selected
                        : bloc.categoryType;

                    return DropdownButton<CategoryType>(
                      hint: const Text("Select a category"),
                      value: selected,
                      items: categories
                          .map(
                            (cat) => DropdownMenuItem<CategoryType>(
                              value: cat,
                              child: Text(cat.name),
                            ),
                          )
                          .toList(),
                      onChanged: (cat) {
                        if (cat != null) {
                          context.read<RecipeBlocBloc>().add(
                            CategorySelectedEvent(cat),
                          );
                        }
                      },
                    );
                  },
                ),

                const Gap(50),
                ElevatedButton(
                  onPressed: () {
                    bloc.add(
                      AddRecipeEvent(
                        recipes: bloc.state.recipes,
                        recipe: RecipeModel(
                          category: bloc.categoryType!,
                          id: '0',
                          title: bloc.titleController.text,
                          description: bloc.descreptionController.text,
                          ingredients: ingredients,
                          steps: steps,
                        ),
                      ),
                    );

                    bloc.titleController.clear();
                    bloc.descreptionController.clear();
                    bloc.ingredientController.clear();
                    bloc.stepController.clear();

                    context.go('/');
                  },
                  child: const Text("Add a Recipe"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
