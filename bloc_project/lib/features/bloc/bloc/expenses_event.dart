part of 'expenses_bloc.dart';

@immutable
sealed class ExpensesEvent {}

class StartEditExpense extends ExpensesEvent {
  final Expense expense;
  StartEditExpense(this.expense);
}

class SubmitEditExpense extends ExpensesEvent {}

class StartAddExpense extends ExpensesEvent {
  final String userId;
  StartAddExpense(this.userId);
}

class SubmitNewExpense extends ExpensesEvent {}
