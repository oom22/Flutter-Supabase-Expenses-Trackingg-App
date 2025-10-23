# Assessment: Recipe App Using Flutter & BLoC

## Introduction

This assessment aims to measure your understanding and ability to build Flutter applications using the `flutter_bloc` library for State Management. The project will focus on creating a simple recipe book application where users can view, add, and filter recipes by category.

## Project Overview

The "Recipe App" is a mobile application that allows users to browse a list of recipes, view details of each recipe, and add new recipes to the list. The primary feature to focus on is the ability to effectively manage application state using the BLoC (Business Logic Component) pattern.

## Required Core Features

1.  **Display Recipe List:**
    *   The main screen should display a list of all available recipes.
    *   Each recipe in the list should show its title, thumbnail image (optional), and category.

2.  **Display Recipe Details:**
    *   When clicking on any recipe in the list, the app should navigate to a new screen displaying all recipe details (title, full description, ingredients, preparation steps).

3.  **Add New Recipe:**
    *   The app should contain a button or icon to add a new recipe.
    *   When pressed, a screen appears containing a Form to input new recipe details (title, description, ingredients, steps, and category).
    *   After saving, the new recipe should appear in the main list.

4.  **Filter Recipes by Category:**
    *   The main screen should provide a way to filter displayed recipes based on their category (for example: Breakfast, Lunch, Dinner, Desserts).
    *   When selecting a specific category, the list should display only recipes belonging to that category.

## Technical Requirements

| Requirement | Description |
| --- | --- |
| **State Management** | `flutter_bloc` and `bloc`  |
| **Data** | You can use mock data stored locally in a Dart file. No need to use a real database or external API. |
| **Navigation** | Use `go_router`. |
| **User Interface (UI)** | The interface should be clean, clear, and easy to use |

## Data Model

You should create a `class` to represent a recipe. It should contain the following fields at minimum:

```dart
class Recipe {
  final String id;
  final String title;
  final String description;
  final List<String> ingredients;
  final List<String> steps;
  final String category; // e.g., 'Breakfast', 'Lunch', 'Dinner'

  Recipe({
    required this.id,
    required this.title,
    required this.description,
    required this.ingredients,
    required this.steps,
    required this.category,
  });
}
```

## Suggested BLoC Structure

To manage recipe state, it is suggested to create a single `RecipesBloc` that handles all recipe-related operations.

*   **Events:**
    *   `LoadRecipes`: To load the initial list of recipes.
    *   `AddRecipe`: To add a new recipe to the list.
    *   `FilterRecipesByCategory`: To filter recipes based on a specific category.

*   **States:**
    *   `RecipesInitial`: The initial state before loading any data.
    *   `RecipesLoadInProgress`: The loading state while fetching recipes.
    *   `RecipesLoadSuccess`: The success state after loading recipes, containing the list of recipes.
    *   `RecipesLoadFailure`: The failure state in case an error occurs while loading data.

## Screen and Widget Structure

*   `RecipesListPage`: The main screen that displays the recipe list and filtering tools. This screen listens to `RecipesBloc` to "rebuild" when the state changes.
*   `RecipeDetailPage`: A screen to display details of a single recipe.
*   `AddRecipePage`: A screen containing a form to add a new recipe. Upon saving, it sends an `AddRecipe` event to `RecipesBloc`.

## Evaluation Criteria

*   **Code Quality:** Code organization, clarity, and following best practices in Dart and Flutter.
*   **BLoC Pattern Implementation:** Correct implementation of BLoCs, events, and states. Separation of Business Logic from the user interface.
*   **Feature Completeness:** Successfully implementing all required core features.

## Bonus Features

If you have extra time, you can add any of the following features:

*   **Search:** Add a search bar to filter recipes by title.
*   **Local Storage:** Save recipes to local storage (using `shared_preferences` or `hive`) so they don't disappear when closing the app.
*   **Animations:** Add animated effects to improve user experience.

