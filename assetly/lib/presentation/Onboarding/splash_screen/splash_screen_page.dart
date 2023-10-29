import 'package:assetly/core/helper/constants_helper.dart';
import 'package:assetly/core/helper/loading_helper.dart';
import 'package:assetly/presentation/Onboarding/landing/landing_page.dart';
import 'package:assetly/presentation/Onboarding/splash_screen/bloc/splash_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    context.read<SplashBloc>().add(const SplashWorkingEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          if (state.loading is LoadingProcessing) {
            // EasyLoading.show();
          }

          if (state.loading is LoadingSuccess) {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const LandingPage()),
                (route) => false);
          }
        },
        child: Center(child: Image.asset("assets/logo.png")),
      ),
    );
  }
}
