import 'package:assetly/core/helper/storage_helper.dart';
import 'package:assetly/presentation/Onboarding/register/bloc/register_bloc.dart';
import 'package:assetly/presentation/Onboarding/splash_screen/bloc/splash_bloc.dart';
import 'package:assetly/presentation/Onboarding/splash_screen/splash_screen_page.dart';
import 'package:assetly/presentation/home/tabbed_page/tabbed_page_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    StorageHelper.init();

    return MultiBlocProvider(
      providers: buildProviders(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        builder: EasyLoading.init(),
        home: const Scaffold(
          body: Center(
            child: SplashScreenPage(),
          ),
        ),
      ),
    );
  }
}

buildProviders() => [
      BlocProvider(create: (_) => SplashBloc()),
      BlocProvider(create: (_) => RegisterBloc()),
    ];
