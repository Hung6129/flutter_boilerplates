import 'package:flutter/material.dart';
import 'package:flutter_boilerplates/config/constants/app_constants.dart';
import 'package:flutter_boilerplates/core/widgets/app_bar_widget.dart';
import 'package:flutter_boilerplates/core/widgets/buttons/app_outlined_button_widget.dart';
import 'package:flutter_boilerplates/features/authenticate/presentation/pages/signin_page.dart';

class FeatureDemoPage extends StatelessWidget {
  const FeatureDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        text: 'Feature Demo',
        goBackEnabled: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppOutlinedButtonWidget(
            'Authenticate',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SigninPage(),
                ),
              );
            },
          ),
          SizedBox(height: AppUIConstants.majorScalePadding(2)),
          AppOutlinedButtonWidget(
            'Lucky wheel',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
