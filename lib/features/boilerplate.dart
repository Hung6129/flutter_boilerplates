import 'package:flutter/material.dart';
import 'package:flutter_boilerplates/config/constants/app_constants.dart';
import 'package:flutter_boilerplates/core/utils/card_utils.dart';
import 'package:flutter_boilerplates/core/utils/dialog_util.dart';
import 'package:flutter_boilerplates/core/widgets/app_bar_widget.dart';
import 'package:flutter_boilerplates/core/widgets/app_main_widget.dart';
import 'package:flutter_boilerplates/core/widgets/buttons/app_filled_button_widget.dart';
import 'package:flutter_boilerplates/core/widgets/buttons/app_icon_button_widget.dart';
import 'package:flutter_boilerplates/core/widgets/buttons/app_outlined_button_widget.dart';
import 'package:flutter_boilerplates/core/widgets/buttons/app_outlined_button_with_icon_widget.dart';
import 'package:flutter_boilerplates/core/widgets/buttons/app_outlined_icon_button_widget.dart';
import 'package:flutter_boilerplates/core/widgets/buttons/app_text_button_widget.dart';
import 'package:flutter_boilerplates/core/widgets/card/app_card_item.dart';
import 'package:flutter_boilerplates/core/widgets/card/app_card_layout.dart';
import 'package:flutter_boilerplates/core/widgets/texts/app_text_widget.dart';
import 'package:get/get.dart';

class Boilerplate extends StatefulWidget {
  const Boilerplate({super.key});

  @override
  State<Boilerplate> createState() => _BoilerplateState();
}

class _BoilerplateState extends State<Boilerplate> {
  @override
  Widget build(BuildContext context) {
    return AppMainWidget(
      appBarWidget: const AppBarWidget(
        goBackEnabled: false,
        text: 'Boilerplate',
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          /// Buttons
          _buildButtons(context),
          SizedBox(height: AppUIConstants.defaultPadding),
          SizedBox(height: AppUIConstants.defaultPadding),
          SizedBox(height: AppUIConstants.defaultPadding),
          SizedBox(height: AppUIConstants.defaultPadding),

          /// Cards
          _buildCards(context),

          /// Dialogs
          _buildDialogs(context),

          SizedBox(height: AppUIConstants.defaultPadding),
          SizedBox(height: AppUIConstants.defaultPadding),
          SizedBox(height: AppUIConstants.defaultPadding),
          SizedBox(height: AppUIConstants.defaultPadding),
        ],
      ),
    );
  }

  Column _buildDialogs(BuildContext context) {
    return Column(
      children: [
        AppTextWidget(
          'Dialog',
          textStyle: context.theme.textTheme.headlineMedium,
        ),
        SizedBox(height: AppUIConstants.defaultPadding),
        AppOutlinedButtonWidget(
          'Cảnh báo',
          onPressed: () {
            DialogUtil.onDialogWarning(
              context,
              title: 'Warning',
              subText: 'This is a warning dialog',
            );
          },
        ),
        SizedBox(height: AppUIConstants.majorScaleMargin(2)),
        AppOutlinedButtonWidget(
          'Lỗi',
          onPressed: () {
            DialogUtil.onDialogError(
              context,
              title: 'Error',
              subText: 'This is an error dialog',
            );
          },
        ),
        SizedBox(height: AppUIConstants.majorScaleMargin(2)),
        AppOutlinedButtonWidget(
          'Thành công',
          onPressed: () {
            DialogUtil.onDialogSuccess(
              context,
              title: 'Success',
              subText: 'This is a success dialog',
            );
          },
        ),
      ],
    );
  }

  Column _buildCards(BuildContext context) {
    return Column(
      children: [
        AppTextWidget(
          'Card',
          textStyle: context.theme.textTheme.headlineMedium,
        ),
        SizedBox(height: AppUIConstants.defaultPadding),
        const AppCartItemContentWithIcon(
          icon: Icon(Icons.add),
          content: 'App Cart Item Content With Icon',
        ),
        SizedBox(height: AppUIConstants.defaultPadding),
        AppCardLayoutWidget(
          header: AppTextWidget(
            'Header',
            textStyle: context.theme.textTheme.titleLarge,
          ),
          subHeader: AppTextWidget(
            'Sub Header',
            textStyle: context.theme.textTheme.titleSmall,
          ),
          content: AppTextWidget(
            'Content',
            textStyle: context.theme.textTheme.bodyMedium,
          ),
          subContent: AppTextWidget(
            'Sub Content',
            textStyle: context.theme.textTheme.bodySmall,
          ),
          actions: [
            CardUtils.buildDelete(context, () {}),
            CardUtils.buildEdit(context, () {}),
          ],
        ),
      ],
    );
  }

  Column _buildButtons(BuildContext context) {
    return Column(
      children: [
        AppTextWidget(
          'Button',
          textStyle: context.theme.textTheme.headlineMedium,
        ),
        SizedBox(height: AppUIConstants.defaultPadding),
        Row(
          children: [
            AppOutlinedIconButtonWidget(
              icon: Icons.add_ic_call,
              onPressed: () {},
            ),
            AppIconButtonWidget(
              icon: Icons.add,
              onPressed: () {},
            ),
          ],
        ),
        SizedBox(height: AppUIConstants.majorScaleMargin(2)),
        AppFilledButtonWidget(
          'Filled Button',
          onPressed: () {},
        ),
        SizedBox(height: AppUIConstants.majorScaleMargin(2)),
        AppOutlinedButtonWidget(
          'Outlined Button',
          onPressed: () {},
        ),
        SizedBox(height: AppUIConstants.majorScaleMargin(2)),
        AppTextButtonWidget('Text Button', onPressed: () {}),
        SizedBox(height: AppUIConstants.majorScaleMargin(2)),
        AppOutlinedWithIconButtonWidget(
          'Outlined with Icon Button',
          prefixIcon: const Icon(Icons.add),
          onPressed: () {},
        ),
      ],
    );
  }
}
