import 'package:dart_mappable/dart_mappable.dart';

part 'recipe_model.mapper.dart';

@MappableClass()
class RecipeModel with RecipeModelMappable {
  final String id;
  final String title;
  final String description;
  final List<String> ingredients;
  final List<String> steps;
  @MappableEnum(defaultValue: CategoryType.other)
  final CategoryType category;

  RecipeModel({
    required this.id,
    required this.title,
    required this.description,
    required this.ingredients,
    required this.steps,
    required this.category,
  });
}

enum CategoryType { breakfast, launch, dinner, other }
