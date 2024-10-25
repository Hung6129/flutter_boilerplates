import 'package:flutter/material.dart';
import 'package:flutter_boilerplates/config/constants/app_constants.dart';
import 'package:flutter_boilerplates/core/utils/card_utils.dart';
import 'package:flutter_boilerplates/core/utils/dialog_util.dart';
import 'package:flutter_boilerplates/core/utils/form_utils.dart';
import 'package:flutter_boilerplates/core/widgets/app_bar_widget.dart';
import 'package:flutter_boilerplates/core/widgets/app_main_widget.dart';
import 'package:flutter_boilerplates/core/widgets/bottomsheet/app_bottom_sheet_widget.dart';
import 'package:flutter_boilerplates/core/widgets/buttons/app_filled_button_widget.dart';
import 'package:flutter_boilerplates/core/widgets/buttons/app_icon_button_widget.dart';
import 'package:flutter_boilerplates/core/widgets/buttons/app_outlined_button_widget.dart';
import 'package:flutter_boilerplates/core/widgets/buttons/app_outlined_button_with_icon_widget.dart';
import 'package:flutter_boilerplates/core/widgets/buttons/app_outlined_icon_button_widget.dart';
import 'package:flutter_boilerplates/core/widgets/buttons/app_text_button_widget.dart';
import 'package:flutter_boilerplates/core/widgets/card/app_card_item.dart';
import 'package:flutter_boilerplates/core/widgets/card/app_card_layout.dart';
import 'package:flutter_boilerplates/core/widgets/texts/app_text_widget.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class Boilerplate extends StatefulWidget {
  const Boilerplate({super.key});

  @override
  State<Boilerplate> createState() => _BoilerplateState();
}

final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

class _BoilerplateState extends State<Boilerplate> {
  @override
  Widget build(BuildContext context) {
    return AppMainWidget(
      appBarWidget: const AppBarWidget(
        goBackEnabled: false,
        text: 'Boilerplate',
      ),
      body: ListView(
        children: [
          /// Buttons
          _buildButtons(context),
          SizedBox(height: AppUIConstants.defaultPadding),
          SizedBox(height: AppUIConstants.defaultPadding),
          SizedBox(height: AppUIConstants.defaultPadding),
          SizedBox(height: AppUIConstants.defaultPadding),

          /// Cards
          _buildCards(context),
          SizedBox(height: AppUIConstants.defaultPadding),
          SizedBox(height: AppUIConstants.defaultPadding),
          SizedBox(height: AppUIConstants.defaultPadding),
          SizedBox(height: AppUIConstants.defaultPadding),

          /// Dialogs
          _buildDialogs(context),
          SizedBox(height: AppUIConstants.defaultPadding),
          SizedBox(height: AppUIConstants.defaultPadding),
          SizedBox(height: AppUIConstants.defaultPadding),
          SizedBox(height: AppUIConstants.defaultPadding),

          /// TextFields
          _buildTextFields(context),
          SizedBox(height: AppUIConstants.defaultPadding),
          SizedBox(height: AppUIConstants.defaultPadding),
          SizedBox(height: AppUIConstants.defaultPadding),
          SizedBox(height: AppUIConstants.defaultPadding),

          /// Bottom sheet
          _buildBottomSheet(context),
          SizedBox(height: AppUIConstants.defaultPadding),
          SizedBox(height: AppUIConstants.defaultPadding),
          SizedBox(height: AppUIConstants.defaultPadding),
          SizedBox(height: AppUIConstants.defaultPadding),
        ],
      ),
    );
  }

  Widget _buildBottomSheet(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppUIConstants.defaultPadding),
      child: Column(
        children: [
          AppTextWidget(
            'Bottom Sheet',
            textStyle: context.theme.textTheme.headlineMedium,
          ),
          SizedBox(height: AppUIConstants.defaultPadding),
          AppOutlinedButtonWidget(
            'Chọn ảnh',
            onPressed: () {
              AppBottomSheetWidget.showBottomSheetPickImageWidget(context,
                  onPickerCamera: () {}, onPickerImage: () {});
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTextFields(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppUIConstants.defaultPadding),
      child: Column(
        children: [
          AppTextWidget(
            'Text Field',
            textStyle: context.theme.textTheme.headlineMedium,
          ),
          SizedBox(height: AppUIConstants.defaultPadding),
          FormBuilder(
            key: _formKey,
            child: Column(
              children: [
                FormUtils.renderOutlineInputField(
                  context,
                  key: 'renderOutlineInputField',
                  label: 'App Text Field Outline Widget',
                  hintText: 'Hint Text',
                  require: true,
                  suffixIcon: const Icon(Icons.place),
                  onChanged: (value) {},
                ),
                SizedBox(height: AppUIConstants.majorScaleMargin(4)),
                FormUtils.renderMyInputField(
                  context,
                  key: 'renderMyInputField',
                  label: 'App Text Field Widget',
                  hintText: 'Hint Text',
                  initValue: 'Initial Value',
                  suffixIcon: const Icon(Icons.search),
                  onChanged: (value) {},
                ),
                SizedBox(height: AppUIConstants.majorScaleMargin(4)),
                FormUtils.renderInputField(
                  context,
                  key: 'renderInputField',
                  label: 'App Text Field Widget',
                  hintText: 'Hint Text',
                  suffixIcon: const Icon(Icons.search),
                  onChanged: (value) {},
                ),
                SizedBox(height: AppUIConstants.majorScaleMargin(4)),
                FormUtils.renderPasswordField(
                  context,
                  key: 'renderPasswordField',
                  label: 'App Text Field Password Widget',
                  hintText: 'Hint Text',
                ),
                SizedBox(height: AppUIConstants.majorScaleMargin(4)),
                FormUtils.renderDatePickerField(
                  context,
                  key: 'renderDatePickerField',
                  label: 'App Date Picker Field Widget',
                  onChanged: (value) {},
                ),
                SizedBox(height: AppUIConstants.majorScaleMargin(4)),
                FormUtils.buildRowInputMoney(
                  context,
                  'Đơn vị tiền nợ',
                  'buildRowInputMoney',
                ),
                SizedBox(height: AppUIConstants.majorScaleMargin(4)),
                FormUtils.buildDateRange(
                  name: 'dateRange',
                  fromName: 'fromDate',
                  toName: 'toDate',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDialogs(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppUIConstants.defaultPadding),
      child: Column(
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
          SizedBox(height: AppUIConstants.majorScaleMargin(4)),
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
          SizedBox(height: AppUIConstants.majorScaleMargin(4)),
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
      ),
    );
  }

  Widget _buildCards(BuildContext context) {
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

  Widget _buildButtons(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppUIConstants.defaultPadding),
      child: Column(
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
          SizedBox(height: AppUIConstants.majorScaleMargin(4)),
          AppFilledButtonWidget(
            'Filled Button',
            onPressed: () {},
          ),
          SizedBox(height: AppUIConstants.majorScaleMargin(4)),
          AppOutlinedButtonWidget(
            'Outlined Button',
            onPressed: () {},
          ),
          SizedBox(height: AppUIConstants.majorScaleMargin(4)),
          AppTextButtonWidget('Text Button', onPressed: () {}),
          SizedBox(height: AppUIConstants.majorScaleMargin(4)),
          AppOutlinedWithIconButtonWidget(
            'Outlined with Icon Button',
            prefixIcon: const Icon(Icons.add),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
