import 'package:example/app/extensions/context_extensions.dart';
import 'package:example/presentation/home_page/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:i_core_modules/i_core_modules.dart';

class HomePage extends BaseScreen {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState
    extends BaseScreenState<HomePage, HomeEvent, HomeState, HomeBloc> {
  @override
  Widget buildMobile(BuildContext context, state) {
    return Scaffold(
      bottomNavigationBar: Text(
        context.appVersion,
        textAlign: TextAlign.center,
      ),
      appBar: AppBar(
        title: Text(
          'Home Page',
          style: context.font.h5.apply(
            color: context.color.neutral.seven,
          ),
        ),
      ),
      body: _buildBody(state),
    );
  }

  Widget _buildBody(HomeState state) {
    if (state.status == BaseStateEnums.processing) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (state.status == BaseStateEnums.success) {
      return Center(
        child: Text(
          state.data!.homeBanner,
          style: context.font.h5.apply(
            color: context.color.neutral.seven,
          ),
        ),
      );
    } else {
      return const Center(
        child: Text('Error'),
      );
    }
  }

  @override
  void initBloc() {
    bloc.add(const InitHomeEvent());
  }
}
