import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter95/flutter95.dart';
import 'package:supa_project/features/add_expense/add_expense_screen.dart';
import 'package:supa_project/features/auth/sign_in/sign_in_screen.dart';
import 'package:supa_project/features/bloc/bloc/expenses_bloc.dart';
import 'package:supa_project/features/edit_expense/edit_expense_screen.dart';
import 'package:supa_project/features/expense_details/expense_details_screen.dart';
import 'package:supa_project/models/expense_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ExpensesListScreen extends StatefulWidget {
  const ExpensesListScreen({super.key});

  @override
  State<ExpensesListScreen> createState() => _ExpensesListScreenState();
}

class _ExpensesListScreenState extends State<ExpensesListScreen> {
  late Future<List<Expense>> futureExpenses;

  @override
  void initState() {
    super.initState();
    futureExpenses = loadExpenses();
  }

  Future<List<Expense>> loadExpenses() async {
    final rows = await Supabase.instance.client
        .from('expenses')
        .select()
        .order('created_at', ascending: false);

    return rows
        .map((m) => ExpenseMapper.fromMap(Map<String, dynamic>.from(m)))
        .toList();
  }

  Future<void> refresh() async {
    setState(() {
      futureExpenses = loadExpenses();
    });
  }

  Future<void> deleteExpense(Expense e) async {
    await Supabase.instance.client.from('expenses').delete().eq('id', e.id);
    if (!mounted) return;
    await showDialog95(
      context: context,
      title: 'تم الحذف',
      message: 'تم حذف المصروف بنجاح.',
    );
    await refresh();
  }

  Future<String?> showActionsDialog(Expense e) {
    return showDialog<String>(
      context: context,
      builder: (_) => Dialog(
        child: Elevation95(
          type: Elevation95Type.down,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 320),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('اختر إجراء', style: Flutter95.textStyle),
                  const Divider95(height: 24, indent: 8, endIndent: 8),
                  SizedBox(
                    width: double.infinity,
                    child: Button95(
                      height: 40,
                      onTap: () => Navigator.pop(context, 'edit'),
                      child: Text('تعديل', style: Flutter95.textStyle),
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: double.infinity,
                    child: Button95(
                      height: 40,
                      onTap: () => Navigator.pop(context, 'delete'),
                      child: Text('حذف', style: Flutter95.textStyle),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<bool?> confirmDeleteDialog(Expense e) {
    return showDialog<bool>(
      context: context,
      builder: (_) => Dialog(
        child: Elevation95(
          type: Elevation95Type.down,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 360),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('تأكيد الحذف', style: Flutter95.textStyle),
                  const SizedBox(height: 10),
                  Text(
                    'سيتم حذف "${e.category}" (${e.amount}). هل أنت متأكد؟',
                    style: Flutter95.textStyle,
                    textAlign: TextAlign.center,
                  ),
                  const Divider95(height: 24, indent: 8, endIndent: 8),
                  Row(
                    children: [
                      Expanded(
                        child: Button95(
                          onTap: () => Navigator.pop(context, false),
                          child: Text('إلغاء', style: Flutter95.textStyle),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Button95(
                          onTap: () => Navigator.pop(context, true),
                          child: Text('حذف', style: Flutter95.textStyle),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget expenseTile(BuildContext context, Expense e) {
    final dt = e.createdAt;
    final time = (dt == null)
        ? ''
        : '${dt.year}-${dt.month.toString().padLeft(2, '0')}-${dt.day.toString().padLeft(2, '0')} '
              '${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}';

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
      child: Elevation95(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (_) => ExpenseDetails95Screen(expense: e),
              ),
            );
          },
          onLongPress: () async {
            final action = await showActionsDialog(e);
            if (!mounted || action == null) return;

            if (action == 'edit') {
              await Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (_) => EditExpenseScreen(expense: e),
                ),
              );
              await refresh();
            } else if (action == 'delete') {
              final ok = await confirmDeleteDialog(e);
              if (ok == true) {
                try {
                  await deleteExpense(e);
                } catch (err) {
                  if (!mounted) return;
                  await showDialog95(
                    context: context,
                    title: 'خطأ',
                    message: 'فشل الحذف: $err',
                  );
                }
              }
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Elevation95(
                  child: SizedBox(
                    width: 36,
                    height: 36,
                    child: Center(
                      child: Text(
                        e.category.isNotEmpty
                            ? e.category[0].toUpperCase()
                            : '',
                        style: Flutter95.textStyle,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: DefaultTextStyle(
                    style: Flutter95.textStyle,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          e.category,
                          style: Flutter95.textStyle.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        if ((e.description ?? '').isNotEmpty) ...[
                          const SizedBox(height: 2),
                          Text(
                            e.description!,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                        if (time.isNotEmpty) ...[
                          const SizedBox(height: 2),
                          Text(
                            time,
                            style: Flutter95.textStyle.copyWith(fontSize: 12),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  e.amount.toString(),
                  style: Flutter95.textStyle.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> logout() async {
    try {
      await Supabase.instance.client.auth.signOut();
      if (!mounted) return;
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => const LoginInScreen()),
        (route) => false,
      );
    } catch (e) {
      if (!mounted) return;
      await showDialog95(
        context: context,
        title: 'خطأ',
        message: 'تعذر تسجيل الخروج: $e',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ExpensesBloc(),
      child: Scaffold95(
        title: 'قائمة المصروفات',
        toolbar: Toolbar95(
          actions: [
            Item95(
              label: 'الحساب',
              menu: Menu95(
                items: [MenuItem95(value: 'logout', label: 'تسجيل الخروج')],
                onItemSelected: (value) async {
                  if (value == 'logout') {
                    final confirm = await showDialog<bool>(
                      context: context,
                      builder: (_) => Dialog(
                        child: Elevation95(
                          type: Elevation95Type.down,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: ConstrainedBox(
                              constraints: const BoxConstraints(maxWidth: 360),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'تأكيد تسجيل الخروج',
                                    style: Flutter95.textStyle,
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    'هل تريد تسجيل الخروج؟',
                                    style: Flutter95.textStyle,
                                  ),
                                  const Divider95(
                                    height: 24,
                                    indent: 8,
                                    endIndent: 8,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Button95(
                                          height: 40,
                                          onTap: () =>
                                              Navigator.pop(context, false),
                                          child: Text(
                                            'إلغاء',
                                            style: Flutter95.textStyle,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: Button95(
                                          height: 40,
                                          onTap: () =>
                                              Navigator.pop(context, true),
                                          child: Text(
                                            'خروج',
                                            style: Flutter95.textStyle,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                    if (confirm == true) {
                      await logout();
                    }
                  }
                },
              ),
            ),
            const Item95(label: 'مساعدة'),
          ],
        ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Elevation95(
                type: Elevation95Type.down,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FutureBuilder<List<Expense>>(
                    future: futureExpenses,
                    builder: (context, snap) {
                      if (snap.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (snap.hasError) {
                        return Center(
                          child: Text(
                            'Error: ${snap.error}',
                            style: Flutter95.textStyle,
                          ),
                        );
                      }

                      final userId =
                          Supabase.instance.client.auth.currentUser?.id;
                      final expenses = (snap.data ?? const <Expense>[])
                          .where((e) => e.userId == userId)
                          .toList();

                      if (expenses.isEmpty) {
                        return Center(
                          child: Text(
                            'لا توجد مصروفات بعد',
                            style: Flutter95.textStyle,
                          ),
                        );
                      }

                      return RefreshIndicator(
                        onRefresh: refresh,
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: expenses.length,
                          itemBuilder: (context, i) =>
                              expenseTile(context, expenses[i]),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),

            Positioned(
              right: 12,
              bottom: 12,
              child: Elevation95(
                child: GestureDetector(
                  onTap: () async {
                    final userId =
                        Supabase.instance.client.auth.currentUser?.id;
                    if (userId == null) {
                      await showDialog95(
                        context: context,
                        title: 'تنبيه',
                        message: 'المستخدم غير مسجل دخول.',
                      );
                      return;
                    }
                    await Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => AddExpenseScreen(userId: userId),
                      ),
                    );
                    await refresh();
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    child: Text('إضافة', style: Flutter95.textStyle),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
