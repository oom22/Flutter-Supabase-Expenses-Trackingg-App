// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'recipe_model.dart';

class RecipeModelMapper extends ClassMapperBase<RecipeModel> {
  RecipeModelMapper._();

  static RecipeModelMapper? _instance;
  static RecipeModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RecipeModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'RecipeModel';

  static String _$id(RecipeModel v) => v.id;
  static const Field<RecipeModel, String> _f$id = Field('id', _$id);
  static String _$title(RecipeModel v) => v.title;
  static const Field<RecipeModel, String> _f$title = Field('title', _$title);
  static String _$description(RecipeModel v) => v.description;
  static const Field<RecipeModel, String> _f$description = Field(
    'description',
    _$description,
  );
  static List<String> _$ingredients(RecipeModel v) => v.ingredients;
  static const Field<RecipeModel, List<String>> _f$ingredients = Field(
    'ingredients',
    _$ingredients,
  );
  static List<String> _$steps(RecipeModel v) => v.steps;
  static const Field<RecipeModel, List<String>> _f$steps = Field(
    'steps',
    _$steps,
  );
  static CategoryType _$category(RecipeModel v) => v.category;
  static const Field<RecipeModel, CategoryType> _f$category = Field(
    'category',
    _$category,
  );

  @override
  final MappableFields<RecipeModel> fields = const {
    #id: _f$id,
    #title: _f$title,
    #description: _f$description,
    #ingredients: _f$ingredients,
    #steps: _f$steps,
    #category: _f$category,
  };

  static RecipeModel _instantiate(DecodingData data) {
    return RecipeModel(
      id: data.dec(_f$id),
      title: data.dec(_f$title),
      description: data.dec(_f$description),
      ingredients: data.dec(_f$ingredients),
      steps: data.dec(_f$steps),
      category: data.dec(_f$category),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static RecipeModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<RecipeModel>(map);
  }

  static RecipeModel fromJson(String json) {
    return ensureInitialized().decodeJson<RecipeModel>(json);
  }
}

mixin RecipeModelMappable {
  String toJson() {
    return RecipeModelMapper.ensureInitialized().encodeJson<RecipeModel>(
      this as RecipeModel,
    );
  }

  Map<String, dynamic> toMap() {
    return RecipeModelMapper.ensureInitialized().encodeMap<RecipeModel>(
      this as RecipeModel,
    );
  }

  RecipeModelCopyWith<RecipeModel, RecipeModel, RecipeModel> get copyWith =>
      _RecipeModelCopyWithImpl<RecipeModel, RecipeModel>(
        this as RecipeModel,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return RecipeModelMapper.ensureInitialized().stringifyValue(
      this as RecipeModel,
    );
  }

  @override
  bool operator ==(Object other) {
    return RecipeModelMapper.ensureInitialized().equalsValue(
      this as RecipeModel,
      other,
    );
  }

  @override
  int get hashCode {
    return RecipeModelMapper.ensureInitialized().hashValue(this as RecipeModel);
  }
}

extension RecipeModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, RecipeModel, $Out> {
  RecipeModelCopyWith<$R, RecipeModel, $Out> get $asRecipeModel =>
      $base.as((v, t, t2) => _RecipeModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class RecipeModelCopyWith<$R, $In extends RecipeModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get ingredients;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get steps;
  $R call({
    String? id,
    String? title,
    String? description,
    List<String>? ingredients,
    List<String>? steps,
    CategoryType? category,
  });
  RecipeModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _RecipeModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, RecipeModel, $Out>
    implements RecipeModelCopyWith<$R, RecipeModel, $Out> {
  _RecipeModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<RecipeModel> $mapper =
      RecipeModelMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>
  get ingredients => ListCopyWith(
    $value.ingredients,
    (v, t) => ObjectCopyWith(v, $identity, t),
    (v) => call(ingredients: v),
  );
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get steps =>
      ListCopyWith(
        $value.steps,
        (v, t) => ObjectCopyWith(v, $identity, t),
        (v) => call(steps: v),
      );
  @override
  $R call({
    String? id,
    String? title,
    String? description,
    List<String>? ingredients,
    List<String>? steps,
    CategoryType? category,
  }) => $apply(
    FieldCopyWithData({
      if (id != null) #id: id,
      if (title != null) #title: title,
      if (description != null) #description: description,
      if (ingredients != null) #ingredients: ingredients,
      if (steps != null) #steps: steps,
      if (category != null) #category: category,
    }),
  );
  @override
  RecipeModel $make(CopyWithData data) => RecipeModel(
    id: data.get(#id, or: $value.id),
    title: data.get(#title, or: $value.title),
    description: data.get(#description, or: $value.description),
    ingredients: data.get(#ingredients, or: $value.ingredients),
    steps: data.get(#steps, or: $value.steps),
    category: data.get(#category, or: $value.category),
  );

  @override
  RecipeModelCopyWith<$R2, RecipeModel, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _RecipeModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

