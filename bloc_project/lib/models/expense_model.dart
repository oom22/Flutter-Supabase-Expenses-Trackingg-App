import 'package:dart_mappable/dart_mappable.dart';

part 'expense_model.mapper.dart';

@MappableClass()
class Expense with ExpenseMappable {
  final String id;
  @MappableField(key: 'user_id')

  final String userId;
  final double amount;
  final String? description;
  final String category;
  @MappableField(key: 'created_at')
  final DateTime? createdAt;

  Expense(
    this.id,
    this.createdAt,
    this.userId,
    this.amount,
    this.description,
    this.category,
  );
}
