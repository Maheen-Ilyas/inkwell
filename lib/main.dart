import 'package:flutter/material.dart';
import 'package:inkwell/app.dart';
import 'package:inkwell/core/secrets/app_secrets.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: AppSecrets.url,
    anonKey: AppSecrets.anonKey,
  );
  runApp(const MyApp());
}
