import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supa_project/models/expense_model.dart';

part 'expenses_event.dart';
part 'expenses_state.dart';

class ExpensesBloc extends Bloc<ExpensesEvent, ExpensesState> {
  final TextEditingController idCtrl = TextEditingController();
  final TextEditingController userIdCtrl = TextEditingController();
  final TextEditingController amountCtrl = TextEditingController();
  final TextEditingController categoryCtrl = TextEditingController();
  final TextEditingController descriptionCtrl = TextEditingController();
  final TextEditingController createdAtCtrl = TextEditingController();
  final List<String> categories = const [
    'Food',
    'Transportation',
    'Bills',
    'Entertainment',
    'Health',
  ];

  final supabase = Supabase.instance.client;

  ExpensesBloc() : super(ExpensesInitial()) {
    on<StartEditExpense>(onStartEdit);
    on<SubmitEditExpense>(onSubmitEdit);
    on<StartAddExpense>(onStartAdd);
    on<SubmitNewExpense>(onSubmitNew);
  }

  void onStartEdit(StartEditExpense event, Emitter<ExpensesState> emit) {
    final e = event.expense;
    idCtrl.text = e.id;
    userIdCtrl.text = e.userId;
    amountCtrl.text = e.amount.toString();
    categoryCtrl.text = e.category;
    descriptionCtrl.text = e.description ?? '';
    createdAtCtrl.text = e.createdAt?.toString() ?? '';
    emit(ExpenseEditing(e));
  }

  Future<void> onSubmitEdit(
    SubmitEditExpense event,
    Emitter<ExpensesState> emit,
  ) async {
    emit(ExpenseSaving());
    try {
      final amount = double.tryParse(amountCtrl.text.trim());
      if (amount == null) throw Exception('Amount must be a number.');

      final update = <String, dynamic>{
        'amount': amount,
        'category': categoryCtrl.text.trim(),
        'description': descriptionCtrl.text.trim().isEmpty
            ? null
            : descriptionCtrl.text.trim(),
      };

      await supabase.from('expenses').update(update).eq('id', idCtrl.text);

      final updated = Expense(
        idCtrl.text,
        createdAtCtrl.text.trim().isEmpty
            ? null
            : DateTime.tryParse(createdAtCtrl.text.trim()),
        userIdCtrl.text.trim(),
        amount,
        descriptionCtrl.text.trim().isEmpty
            ? null
            : descriptionCtrl.text.trim(),
        categoryCtrl.text.trim(),
      );

      emit(ExpenseSaved(updated));
    } catch (e) {
      emit(ExpenseError(e.toString()));
    }
  }

  void onStartAdd(StartAddExpense event, Emitter<ExpensesState> emit) {
    idCtrl.clear();
    userIdCtrl.text = event.userId;
    amountCtrl.clear();
    categoryCtrl.clear();
    descriptionCtrl.clear();
    createdAtCtrl.clear();
    emit(ExpensesInitial());
  }

  Future<void> onSubmitNew(
    SubmitNewExpense event,
    Emitter<ExpensesState> emit,
  ) async {
    emit(ExpenseSaving());
    try {
      final amount = double.tryParse(amountCtrl.text.trim());
      if (amount == null) throw Exception('Amount must be a number.');

      final insert = <String, dynamic>{
        'user_id': userIdCtrl.text.trim(),
        'amount': amount,
        'category': categoryCtrl.text.trim(),
        'description': descriptionCtrl.text.trim().isEmpty
            ? null
            : descriptionCtrl.text.trim(),
      };

      final inserted = await supabase
          .from('expenses')
          .insert(insert)
          .select()
          .single();

      final created = ExpenseMapper.fromMap(
        Map<String, dynamic>.from(inserted),
      );
      emit(ExpenseCreated(created));
    } catch (e) {
      emit(ExpenseError(e.toString()));
    }
  }

  @override
  Future<void> close() {
    idCtrl.dispose();
    userIdCtrl.dispose();
    amountCtrl.dispose();
    categoryCtrl.dispose();
    descriptionCtrl.dispose();
    createdAtCtrl.dispose();
    return super.close();
  }
}
