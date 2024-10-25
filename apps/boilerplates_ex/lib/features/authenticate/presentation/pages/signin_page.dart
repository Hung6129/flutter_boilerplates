import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplates/core/services/injection_service.dart';
import 'package:flutter_boilerplates/core/widgets/texts/app_text_field_password_widget.dart';
import 'package:flutter_boilerplates/core/widgets/texts/app_text_field_widget.dart';
import 'package:flutter_boilerplates/features/authenticate/presentation/bloc/authenticate_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'blur_animate.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => iS<AuthenticateBloc>(),
      child: BlocConsumer<AuthenticateBloc, AuthenticateState>(
        listener: (context, state) {
          if (state.status == AuthenticateStatus.success) {}
          if (state.status == AuthenticateStatus.failure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                content: Text(state.errorMessage),
              ),
            );
          }
        },
        builder: (context, state) {
          return GestureDetector(
            onTap: () {
              // referring issue with node focus: https://github.com/flutter/flutter/issues/54277
              final FocusScopeNode currentScope = FocusScope.of(context);
              if (!currentScope.hasPrimaryFocus && currentScope.hasFocus) {
                FocusManager.instance.primaryFocus?.unfocus();
              }
            },
            child: Scaffold(
              appBar: AppBar(
                title: const Text('Sign in'),
              ),
              resizeToAvoidBottomInset: false,
              body: BlurAnimated(
                childW: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.15),
                    _emailPasswordForm(context),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

// Form for email and password login
  Widget _emailPasswordForm(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Column(
          children: [
            AppTextFieldWidget(
              label: 'Email',
              hintText: 'Email',
              onChanged: (value) {},
            ),
            const SizedBox(height: 10),
            const AppTextFieldPasswordWidget(
              label: 'Password',
              hintText: 'Password',
              maxLines: 1,
              require: true,
              isViewTextOnly: false,
              textInputAction: TextInputAction.done,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Align(
                alignment: Alignment.center,
                child: RichText(
                  text: TextSpan(
                    text: 'Don\'t have an account? ',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Colors.grey,
                        ),
                    children: [
                      // using tap gesture recognizer to navigate to sign up page
                      // related issue: https://stackoverflow.com/a/50011168/14980232
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // navigate to sign up page
                          },
                        text: 'Sign up',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
