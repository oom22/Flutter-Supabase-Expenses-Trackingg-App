part of 'expenses_bloc.dart';

@immutable
sealed class ExpensesState {}

class ExpensesInitial extends ExpensesState {}

class ExpenseEditing extends ExpensesState {
  final Expense expense;
  ExpenseEditing(this.expense);
}

class ExpenseSaving extends ExpensesState {}

class ExpenseSaved extends ExpensesState {
  final Expense updated;
  ExpenseSaved(this.updated);
}

class ExpenseError extends ExpensesState {
  final String message;
  ExpenseError(this.message);
}

class ExpenseCreated extends ExpensesState {
  final Expense created;
  ExpenseCreated(this.created);
}
