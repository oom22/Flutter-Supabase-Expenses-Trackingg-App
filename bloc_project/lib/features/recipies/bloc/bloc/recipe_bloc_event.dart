part of 'recipe_bloc_bloc.dart';

@immutable
sealed class RecipeBlocEvent {}

class LoadRecipesEvent extends RecipeBlocEvent {}

class GoToAddPageEvent extends RecipeBlocEvent {}

class AddRecipeEvent extends RecipeBlocEvent {
  RecipeModel recipe;
  List<RecipeModel> recipes;
  AddRecipeEvent({required this.recipes, required this.recipe});
}

class ShowRecipeEvent extends RecipeBlocEvent {
  final int indexo;
  ShowRecipeEvent({required this.indexo});
}

class FilterRecipiesEvent extends RecipeBlocEvent {
  final CategoryType? category;
  FilterRecipiesEvent(this.category);
}

class CategorySelectedEvent extends RecipeBlocEvent {
  final CategoryType category;
  CategorySelectedEvent(this.category);
}
