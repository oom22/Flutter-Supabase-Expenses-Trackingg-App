import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter95/flutter95.dart';
import 'package:supa_project/features/auth/bloc/bloc/auth_bloc.dart';
import 'package:supa_project/features/auth/sign_up/sign_up_screen.dart';
import 'package:supa_project/features/expenses_list/expenses_list_screen.dart';

class LoginInScreen extends StatelessWidget {
  const LoginInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthBloc(),
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is SucsessSignin) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const ExpensesListScreen()),
            );
          } else if (state is AuthError) {
            showDialog95(
              context: context,
              title: 'خطأ',
              message: state.message,
            );
          }
        },
        child: Scaffold95(
          title: 'تسجيل الدخول',
          toolbar: Toolbar95(
            actions: [
              Item95(
                label: 'ملف',
                menu: Menu95(
                  items: [MenuItem95(value: 'exit', label: 'خروج')],
                  onItemSelected: (v) {
                    if (v == 'exit') Navigator.of(context).maybePop();
                  },
                ),
              ),
              const Item95(label: 'مساعدة'),
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
                    constraints: const BoxConstraints(maxWidth: 420),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.monetization_on, size: 25),
                            const SizedBox(width: 8),
                            Text(
                              'تسجيل الدخول',
                              style: Flutter95.textStyle.copyWith(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const Divider95(height: 20, indent: 8, endIndent: 8),

                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            'البريد الإلكتروني',
                            style: Flutter95.textStyle,
                          ),
                        ),
                        const SizedBox(height: 4),
                        BlocBuilder<AuthBloc, AuthState>(
                          buildWhen: (p, n) => true,
                          builder: (context, state) {
                            final bloc = context.read<AuthBloc>();
                            return TextField95(
                              controller: bloc.emailController,
                              keyboardType: TextInputType.emailAddress,
                              height: 36,
                            );
                          },
                        ),
                        const SizedBox(height: 10),

                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            'كلمة المرور',
                            style: Flutter95.textStyle,
                          ),
                        ),
                        const SizedBox(height: 4),
                        BlocBuilder<AuthBloc, AuthState>(
                          builder: (context, state) {
                            final bloc = context.read<AuthBloc>();
                            return TextField95(
                              controller: bloc.passwordController,
                              height: 36,
                              obscureText: true,
                            );
                          },
                        ),

                        const Divider95(height: 24, indent: 8, endIndent: 8),

                        BlocBuilder<AuthBloc, AuthState>(
                          builder: (context, state) {
                            final isLoading = state is AuthLoading;
                            return SizedBox(
                              width: double.infinity,
                              child: Button95(
                                height: 50,
                                onTap: isLoading
                                    ? null
                                    : () => context.read<AuthBloc>().add(
                                        trySignIn(),
                                      ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    if (isLoading) ...[
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
                                      isLoading
                                          ? 'جاري تسجيل الدخول...'
                                          : 'تسجيل الدخول',
                                      style: Flutter95.textStyle,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),

                        const SizedBox(height: 30),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('ليس لديك حساب؟', style: Flutter95.textStyle),
                            const SizedBox(width: 8),
                            Elevation95(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => SignUpScreen(),
                                    ),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  child: Text(
                                    'إنشاء حساب',
                                    style: Flutter95.textStyle,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 8),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
