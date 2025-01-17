import 'package:flutter/material.dart';
import 'package:third_sp/app/app.dart';
import 'package:third_sp/app/di/di.dart';
// Import for dependency injection

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Ensure all bindings are initialized
  await initDependencies(); // Initialize dependencies before app starts
  runApp(const MyApp());
}
