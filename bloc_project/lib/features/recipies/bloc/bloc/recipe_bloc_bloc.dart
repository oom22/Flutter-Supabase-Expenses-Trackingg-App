import 'package:bloc/bloc.dart';
import 'package:bloc_project/models/recipe_model.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'recipe_bloc_event.dart';
part 'recipe_bloc_state.dart';

class RecipeBlocBloc extends Bloc<RecipeBlocEvent, RecipeBlocState> {
  bool isScrolled = false;
  final ScrollController controller = ScrollController();

  late final TextEditingController titleController = TextEditingController();
  late final TextEditingController descreptionController =
      TextEditingController();
  late final TextEditingController stepController = TextEditingController();
  late final TextEditingController ingredientController =
      TextEditingController();

  CategoryType? categoryType;

  final List<RecipeModel> allRecipes = <RecipeModel>[];
  CategoryType? activeFilter;

  RecipeBlocBloc() : super(RecipeBlocInitialState(const [])) {
    on<LoadRecipesEvent>((event, emit) {
      emit(RecipeBlocInitialState(allRecipes));
    });

    on<AddRecipeEvent>((event, emit) {
      allRecipes.add(event.recipe);

      if (activeFilter != null) {
        final filtered = _filterBy(activeFilter);
        emit(FilteringState(recipes: filtered, activeCategory: activeFilter));
      } else {
        emit(AddedSuccessState(allRecipes));
      }
    });

    on<FilterRecipiesEvent>((event, emit) {
      activeFilter = event.category;
      final filtered = _filterBy(activeFilter);
      emit(FilteringState(recipes: filtered, activeCategory: activeFilter));
    });

    on<GoToAddPageEvent>((event, emit) {
      emit(GoToAddState(state.recipes));
    });

    on<ShowRecipeEvent>((event, emit) {
      emit(ShowDetailsState(state.recipes, event.indexo));
    });

    on<CategorySelectedEvent>((event, emit) {
      categoryType = event.category;
      emit(CategorySelectionState(state.recipes, selected: event.category));
    });
  }

  List<RecipeModel> _filterBy(CategoryType? category) {
    if (category == null) {
      return allRecipes;
    }
    return allRecipes.where((recepie) => recepie.category == category).toList();
  }
}
