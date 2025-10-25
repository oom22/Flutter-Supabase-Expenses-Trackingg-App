part of 'recipe_bloc_bloc.dart';

@immutable
sealed class RecipeBlocState {
  List<RecipeModel> recipes;
  RecipeBlocState(this.recipes);
}

final class RecipeBlocInitialState extends RecipeBlocState {
  List<RecipeModel> recipes;
  RecipeBlocInitialState(this.recipes) : super(recipes);
}

final class RecipesLoadInProgressState extends RecipeBlocState {
  List<RecipeModel> recipes;
  RecipesLoadInProgressState(this.recipes) : super(recipes);
}

final class RecipesLoadSuccessState extends RecipeBlocState {
  List<RecipeModel> recipes;
  RecipesLoadSuccessState(this.recipes) : super(recipes);
}

final class RecipesLoadFailureState extends RecipeBlocState {
  List<RecipeModel> recipes;
  RecipesLoadFailureState(this.recipes) : super(recipes);
}

final class ChangeSliverBarState extends RecipeBlocState {
  List<RecipeModel> recipes;
  ChangeSliverBarState(this.recipes) : super(recipes);
}

final class GoToDetailsState extends RecipeBlocState {
  List<RecipeModel> recipes;
  GoToDetailsState(this.recipes) : super(recipes);
}

final class ShowDetailsState extends RecipeBlocState {
  int index;
  List<RecipeModel> recipes;
  ShowDetailsState(this.recipes, this.index) : super(recipes);
}

final class GoToAddState extends RecipeBlocState {
  List<RecipeModel> recipes;
  GoToAddState(this.recipes) : super(recipes);
}

final class AddedSuccessState extends RecipeBlocState {
  List<RecipeModel> recipes;
  AddedSuccessState(this.recipes) : super(recipes);
}

class FilteringState extends RecipeBlocState {
  @override
  final List<RecipeModel> recipes;
  final CategoryType? activeCategory;
  FilteringState({required this.recipes, required this.activeCategory})
    : super(recipes);
}

class CategorySelectionState extends RecipeBlocState {
  @override
  final List<RecipeModel> recipes;
  final CategoryType? selected;
  CategorySelectionState(this.recipes, {required this.selected})
    : super(recipes);
}
