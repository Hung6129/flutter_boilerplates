import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplates/config/constants/app_constants.dart';
import 'package:flutter_boilerplates/core/services/injection_service.dart';
import 'package:flutter_boilerplates/core/widgets/loading/app_loading_widget.dart';
import 'package:flutter_boilerplates/features/main/main_page.dart';

import '../bloc/walkthrough_bloc.dart';

class WalkThroughPage extends StatelessWidget {
  const WalkThroughPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => iS<WalkthroughBloc>()..add(WalkthroughStarted()),
        ),
      ],
      child: BlocConsumer<WalkthroughBloc, WalkthroughState>(
        listener: (context, state) {
          if (state.status == WalkThroughStatus.completed) {
            MainPage.openPushRemove(context);
          }
        },
        builder: (context, state) {
          return Scaffold(
            bottomNavigationBar: const SizedBox(
              height: 100,
              child: AppLoadingWidget(),
            ),
            body: Center(
              child: Image.asset(
                AppImageAsset.imageCat,
                width: 145,
                height: 145,
              ),
            ),
          );
        },
      ),
    );
  }
}
