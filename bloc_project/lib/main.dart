import 'package:flutter/material.dart';
import 'package:flutter95/flutter95.dart';
import 'package:supa_project/features/auth/sign_up/sign_up_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: '',
    anonKey:
        '',
  );
  runApp(const Flutter95App());
}

class Flutter95App extends StatelessWidget {
  const Flutter95App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Flutter95.background,
      home: SignUpScreen(),
    );
  }
}
