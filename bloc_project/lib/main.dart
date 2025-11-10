import 'package:flutter/material.dart';
import 'package:flutter95/flutter95.dart';
import 'package:supa_project/features/auth/sign_up/sign_up_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://ftegonlousyoxxxzeubq.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ0ZWdvbmxvdXN5b3h4eHpldWJxIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjE1NTkxOTMsImV4cCI6MjA3NzEzNTE5M30.s10QEaO4BRl1qxaI4tZPkCgg69Z2d98OtDM_zrhecRY',
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
