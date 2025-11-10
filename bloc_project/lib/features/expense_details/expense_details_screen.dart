import 'package:flutter/material.dart';
import 'package:flutter95/flutter95.dart';
import 'package:supa_project/models/expense_model.dart';

class ExpenseDetails95Screen extends StatelessWidget {
  final Expense expense;
  final VoidCallback? onEdit;

  const ExpenseDetails95Screen({super.key, required this.expense, this.onEdit});

  String formatDate(DateTime? dt) {
    if (dt == null) return '—';
    final y = dt.year.toString().padLeft(4, '0');
    final m = dt.month.toString().padLeft(2, '0');
    final d = dt.day.toString().padLeft(2, '0');
    final hh = dt.hour.toString().padLeft(2, '0');
    final mm = dt.minute.toString().padLeft(2, '0');
    return '$y-$m-$d  $hh:$mm';
  }

  @override
  Widget build(BuildContext context) {
    final divider = const Divider95(height: 20, endIndent: 8, indent: 8);

    return Scaffold95(
      title: 'Expense Details',
      toolbar: Toolbar95(
        actions: [
          Item95(
            label: 'File',
            menu: Menu95(
              items: [MenuItem95(value: 'close', label: 'Close')],
              onItemSelected: (_) => Navigator.of(context).maybePop(),
            ),
          ),
          if (onEdit != null) Item95(label: 'Edit', onTap: (ctx) => onEdit!()),
          const Item95(label: 'Help'),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Elevation95(
          type: Elevation95Type.down,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Row(
                  children: [
                    const Icon(Icons.receipt_long, size: 18),
                    const SizedBox(width: 8),
                    Text(
                      expense.category,
                      style: Flutter95.textStyle.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    Elevation95(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        child: Text(
                          'المبلغ: ${expense.amount.toStringAsFixed(2)}',
                          style: Flutter95.textStyle,
                        ),
                      ),
                    ),
                  ],
                ),

                divider,

                DetailRow95(
                  label: 'تاريخ الإنشاء',
                  value: formatDate(expense.createdAt),
                ),
                const SizedBox(height: 6),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('الوصف', style: Flutter95.textStyle),
                ),
                const SizedBox(height: 4),
                Elevation95(
                  type: Elevation95Type.up,
                  child: Container(
                    constraints: const BoxConstraints(minHeight: 72),
                    padding: const EdgeInsets.all(8),
                    width: double.infinity,
                    child: Text(
                      (expense.description?.trim().isNotEmpty ?? false)
                          ? expense.description!
                          : '—',
                      style: Flutter95.textStyle,
                    ),
                  ),
                ),

                const Spacer(),
                const Divider95(height: 20, endIndent: 8, indent: 8),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (onEdit != null)
                      Button95(onTap: onEdit, child: const Text('Edit')),
                    const SizedBox(width: 8),
                    Button95(
                      onTap: () => Navigator.of(context).maybePop(),
                      child: const Text('Close'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DetailRow95 extends StatelessWidget {
  final String label;
  final String value;
  final bool mono;

  const DetailRow95({
    required this.label,
    required this.value,
    this.mono = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6.0),
      child: Row(
        children: [
          SizedBox(
            width: 90,
            child: Text(
              '$label:',
              style: Flutter95.textStyle.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Elevation95(
              type: Elevation95Type.up,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                child: Text(
                  value,
                  style: mono
                      ? Flutter95.textStyle.copyWith(fontFamily: 'monospace')
                      : Flutter95.textStyle,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
