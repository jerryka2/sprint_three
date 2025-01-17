import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:third_sp/app/di/di.dart';
import 'package:third_sp/core/theme/app_theme.dart';
import 'package:third_sp/features/splash/presentation/view/splash_screen.dart';
import 'package:third_sp/features/splash/presentation/view_model/cubit/splash_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Enegerize Nepal',
      theme: getApplicationTheme(),
      home: BlocProvider.value(
        value: getIt<SplashCubit>(),
        child: const SplashScreen(),
      ),
    );
  }
}
