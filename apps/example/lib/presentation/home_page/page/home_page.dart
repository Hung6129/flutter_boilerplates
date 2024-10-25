import 'package:example/app/extensions/context_extensions.dart';
import 'package:example/presentation/home_page/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:i_component_module/i_component_module.dart';
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
      return Column(
        children: [
          Text(
            state.data!.homeBanner,
            style: context.font.h5.apply(
              color: context.color.neutral.seven,
            ),
          ),
          UISpacer.h(dimen: 16),
          UIButton.ghost(
            text: 'Ghost Button',
            size: ButtonSize.M,
            onPressed: () {},
          ),
          UISpacer.h(dimen: 16),
          UIButton.icon(
            icon: const Icon(Icons.add),
            onPressed: () {},
          ),
          UISpacer.h(dimen: 16),
          UIButton.primary(
            text: 'Ghost Button',
            size: ButtonSize.M,
            onPressed: () {},
          ),
          UISpacer.h(dimen: 16),
          UIButton.secondary(
            text: 'Ghost Button',
            size: ButtonSize.M,
            onPressed: () {},
          ),
          UISpacer.h(dimen: 16),
          UIButton.text(
            text: 'Ghost Button',
            size: ButtonSize.M,
            onPressed: () {},
          ),
        ],
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
