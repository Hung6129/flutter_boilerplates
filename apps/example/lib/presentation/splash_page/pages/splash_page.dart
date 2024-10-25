import 'package:example/presentation/home_page/page/home_page.dart';
import 'package:example/presentation/splash_page/bloc/splash_bloc.dart';
import 'package:flutter/material.dart';
import 'package:i_core_modules/i_core_modules.dart';

class SplashPage extends BaseScreen {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState
    extends BaseScreenState<SplashPage, SplashEvent, SplashState, SplashBloc> {
  @override
  Widget buildMobile(BuildContext context, BaseBlocState state) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  @override
  void listenerBloc(BuildContext context, SplashState state) {
    super.listenerBloc(context, state);
    if (state.isSuccess) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
        (route) => false,
      );
    }
  }

  @override
  void initBloc() {
    bloc.add(const InitSplashEvent());
  }
}
