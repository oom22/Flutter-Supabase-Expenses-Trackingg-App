import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter95/flutter95.dart';

import 'package:supa_project/features/auth/bloc/bloc/auth_bloc.dart';
import 'package:supa_project/features/auth/sign_in/sign_in_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthBloc(),
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) async {
          if (state is SucsessSignUp) {
            await showDialog95(
              context: context,
              title: 'تم',
              message: 'تم إنشاء الحساب بنجاح!',
            );
            if (!context.mounted) return;
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const LoginInScreen()),
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
          title: 'إنشاء حساب',
          toolbar: Toolbar95(
            actions: [
              Item95(
                label: 'ملف',
                menu: Menu95(
                  items: [
                    MenuItem95(value: 'back', label: 'رجوع'),
                    MenuItem95(value: 'exit', label: 'خروج'),
                  ],
                  onItemSelected: (v) {
                    if (v == 'back') {
                      Navigator.of(context).maybePop();
                    } else if (v == 'exit') {
                      Navigator.of(context).maybePop();
                    }
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
                              'إنشاء حساب جديد',
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
                                        trySignUp(),
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
                                          ? 'جاري إنشاء الحساب...'
                                          : 'إنشاء حساب',
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
                            Text(
                              'لديك حساب بالفعل؟',
                              style: Flutter95.textStyle,
                            ),
                            const SizedBox(width: 8),
                            Elevation95(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => const LoginInScreen(),
                                    ),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  child: Text(
                                    'تسجيل الدخول',
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
