import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter95/flutter95.dart';
import 'package:supa_project/features/bloc/bloc/expenses_bloc.dart';
import 'package:supa_project/models/expense_model.dart';

class EditExpenseScreen extends StatelessWidget {
  final Expense expense;
  const EditExpenseScreen({super.key, required this.expense});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ExpensesBloc()..add(StartEditExpense(expense)),
      child: BlocConsumer<ExpensesBloc, ExpensesState>(
        listener: (context, state) async {
          if (state is ExpenseSaved) {
            await showDialog95(
              context: context,
              title: 'تم الحفظ',
              message: 'تم تحديث المصروف بنجاح.',
            );
            if (context.mounted) Navigator.of(context).pop();
          } else if (state is ExpenseError) {
            showDialog95(
              context: context,
              title: 'خطأ',
              message: state.message,
            );
          }
        },
        builder: (context, state) {
          final bloc = context.read<ExpensesBloc>();
          final isSaving = state is ExpenseSaving;

          return Scaffold95(
            title: 'تعديل المصروف',
            toolbar: const Toolbar95(
              actions: [
                Item95(label: 'ملف'),
                Item95(label: 'مساعدة'),
              ],
            ),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Elevation95(
                  type: Elevation95Type.down,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 520),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text('المبلغ', style: Flutter95.textStyle),
                          ),
                          const SizedBox(height: 4),
                          TextField95(
                            controller: bloc.amountCtrl,
                            height: 36,
                            keyboardType: TextInputType.number,
                          ),
                          const SizedBox(height: 10),

                          Align(
                            alignment: Alignment.centerRight,
                            child: Text('التصنيف', style: Flutter95.textStyle),
                          ),
                          const SizedBox(height: 8),

                          ValueListenableBuilder(
                            valueListenable: context
                                .read<ExpensesBloc>()
                                .categoryCtrl,
                            builder: (context, value, _) {
                              final bloc = context.read<ExpensesBloc>();
                              final categories = [
                                'Food',
                                'Transportation',
                                'Bills',
                                'Entertainment',
                                'Health',
                              ];

                              return Wrap(
                                spacing: 8,
                                runSpacing: 8,
                                children: categories.map((category) {
                                  final isSelected =
                                      bloc.categoryCtrl.text == category;
                                  return Button95(
                                    onTap: () {
                                      bloc.categoryCtrl.text = category;
                                    },
                                    child: Text(
                                      category,
                                      style: Flutter95.textStyle.copyWith(
                                        color: isSelected
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                  );
                                }).toList(),
                              );
                            },
                          ),

                          Align(
                            alignment: Alignment.centerRight,
                            child: Text('الوصف', style: Flutter95.textStyle),
                          ),
                          const SizedBox(height: 4),
                          TextField95(
                            controller: bloc.descriptionCtrl,
                            multiline: true,
                            maxLines: 6,
                            height: 120,
                          ),

                          const Divider95(height: 24, indent: 8, endIndent: 8),

                          SizedBox(
                            width: double.infinity,
                            child: Button95(
                              height: 40,
                              onTap: isSaving
                                  ? null
                                  : () => context.read<ExpensesBloc>().add(
                                      SubmitEditExpense(),
                                    ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  if (isSaving) ...[
                                    const SizedBox(
                                      width: 16,
                                      height: 16,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                  ],
                                  Text(
                                    isSaving
                                        ? 'جاري الحفظ...'
                                        : 'حفظ التغييرات',
                                    style: Flutter95.textStyle,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 6),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
