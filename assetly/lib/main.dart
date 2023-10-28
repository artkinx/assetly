import 'package:assetly/presentation/Onboarding/landing/landing_page.dart';
import 'package:assetly/presentation/Onboarding/register/bloc/register_bloc.dart';
import 'package:assetly/presentation/Onboarding/register/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: buildProviders,
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Center(
            child: RegisterPage(),
          ),
        ),
      ),
    );
  }
}

final buildProviders = [
  BlocProvider(create: (_) => RegisterBloc()),
];
