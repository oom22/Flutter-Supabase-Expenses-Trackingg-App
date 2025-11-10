// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'expense_model.dart';

class ExpenseMapper extends ClassMapperBase<Expense> {
  ExpenseMapper._();

  static ExpenseMapper? _instance;
  static ExpenseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ExpenseMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Expense';

  static String _$id(Expense v) => v.id;
  static const Field<Expense, String> _f$id = Field('id', _$id);
  static DateTime? _$createdAt(Expense v) => v.createdAt;
  static const Field<Expense, DateTime> _f$createdAt = Field(
    'createdAt',
    _$createdAt,
    key: r'created_at',
  );
  static String _$userId(Expense v) => v.userId;
  static const Field<Expense, String> _f$userId = Field(
    'userId',
    _$userId,
    key: r'user_id',
  );
  static double _$amount(Expense v) => v.amount;
  static const Field<Expense, double> _f$amount = Field('amount', _$amount);
  static String? _$description(Expense v) => v.description;
  static const Field<Expense, String> _f$description = Field(
    'description',
    _$description,
  );
  static String _$category(Expense v) => v.category;
  static const Field<Expense, String> _f$category = Field(
    'category',
    _$category,
  );

  @override
  final MappableFields<Expense> fields = const {
    #id: _f$id,
    #createdAt: _f$createdAt,
    #userId: _f$userId,
    #amount: _f$amount,
    #description: _f$description,
    #category: _f$category,
  };

  static Expense _instantiate(DecodingData data) {
    return Expense(
      data.dec(_f$id),
      data.dec(_f$createdAt),
      data.dec(_f$userId),
      data.dec(_f$amount),
      data.dec(_f$description),
      data.dec(_f$category),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static Expense fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Expense>(map);
  }

  static Expense fromJson(String json) {
    return ensureInitialized().decodeJson<Expense>(json);
  }
}

mixin ExpenseMappable {
  String toJson() {
    return ExpenseMapper.ensureInitialized().encodeJson<Expense>(
      this as Expense,
    );
  }

  Map<String, dynamic> toMap() {
    return ExpenseMapper.ensureInitialized().encodeMap<Expense>(
      this as Expense,
    );
  }

  ExpenseCopyWith<Expense, Expense, Expense> get copyWith =>
      _ExpenseCopyWithImpl<Expense, Expense>(
        this as Expense,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return ExpenseMapper.ensureInitialized().stringifyValue(this as Expense);
  }

  @override
  bool operator ==(Object other) {
    return ExpenseMapper.ensureInitialized().equalsValue(
      this as Expense,
      other,
    );
  }

  @override
  int get hashCode {
    return ExpenseMapper.ensureInitialized().hashValue(this as Expense);
  }
}

extension ExpenseValueCopy<$R, $Out> on ObjectCopyWith<$R, Expense, $Out> {
  ExpenseCopyWith<$R, Expense, $Out> get $asExpense =>
      $base.as((v, t, t2) => _ExpenseCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ExpenseCopyWith<$R, $In extends Expense, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    String? id,
    DateTime? createdAt,
    String? userId,
    double? amount,
    String? description,
    String? category,
  });
  ExpenseCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ExpenseCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Expense, $Out>
    implements ExpenseCopyWith<$R, Expense, $Out> {
  _ExpenseCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Expense> $mapper =
      ExpenseMapper.ensureInitialized();
  @override
  $R call({
    String? id,
    Object? createdAt = $none,
    String? userId,
    double? amount,
    Object? description = $none,
    String? category,
  }) => $apply(
    FieldCopyWithData({
      if (id != null) #id: id,
      if (createdAt != $none) #createdAt: createdAt,
      if (userId != null) #userId: userId,
      if (amount != null) #amount: amount,
      if (description != $none) #description: description,
      if (category != null) #category: category,
    }),
  );
  @override
  Expense $make(CopyWithData data) => Expense(
    data.get(#id, or: $value.id),
    data.get(#createdAt, or: $value.createdAt),
    data.get(#userId, or: $value.userId),
    data.get(#amount, or: $value.amount),
    data.get(#description, or: $value.description),
    data.get(#category, or: $value.category),
  );

  @override
  ExpenseCopyWith<$R2, Expense, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _ExpenseCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

