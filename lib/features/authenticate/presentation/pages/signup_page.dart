// import 'package:flutter/material.dart';

// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:form_builder_validators/form_builder_validators.dart';
// import 'package:ihun_movie_app/shared/utils/toastification_cus.dart';
// import 'package:ihun_movie_app/shared/widgets/app_icon_button.dart';

// import '../../../../core/services/injection_service.dart';
// import '../bloc/authenticate_bloc.dart';

// class SignupPage extends StatefulWidget {
//   const SignupPage({super.key});

//   static openFromLogin(BuildContext context) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => BlocProvider(
//           create: (context) => getIt<AuthenticateBloc>(),
//           child: GestureDetector(
//             onTap: () {
//               // referring issue with node focus: https://github.com/flutter/flutter/issues/54277
//               final FocusScopeNode currentScope = FocusScope.of(context);
//               if (!currentScope.hasPrimaryFocus && currentScope.hasFocus) {
//                 FocusManager.instance.primaryFocus?.unfocus();
//               }
//             },
//             child: const SignupPage(),
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   State<SignupPage> createState() => _SignupPageState();
// }

// class _SignupPageState extends State<SignupPage> {
//   final _formKey = GlobalKey<FormBuilderState>();
//   final _emailFieldKey = GlobalKey<FormBuilderFieldState>();
//   final _nameFieldKey = GlobalKey<FormBuilderFieldState>();
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<AuthenticateBloc, AuthenticateState>(
//       listener: (context, state) {
//         if (state.status == AuthenticateStatus.success) {
//           ToastificationCus.showSuccess(context, message: 'Sign up success');
//           Navigator.pop(context);
//         }
//         if (state.status == AuthenticateStatus.failure) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               backgroundColor: Colors.red,
//               content: Text(state.errorMessage),
//             ),
//           );
//         }
//       },
//       builder: (context, state) {
//         return Scaffold(
//           resizeToAvoidBottomInset: false,
//           body: Column(
//             children: [
//               SizedBox(
//                 height: MediaQuery.of(context).size.height * 0.3,
//               ),
//               _signUpForm(context),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   Widget _signUpForm(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(12),
//       child: FormBuilder(
//         key: _formKey,
//         child: Column(
//           children: [
//             FormBuilderTextField(
//               name: 'name',
//               key: _nameFieldKey,
//               style: Theme.of(context).textTheme.bodyMedium!.copyWith(
//                     color: Colors.black,
//                   ),
//               decoration: const InputDecoration(
//                 labelText: 'Your name',
//               ),
//               validator: FormBuilderValidators.compose([
//                 FormBuilderValidators.required(),
//               ]),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             FormBuilderTextField(
//               key: _emailFieldKey,
//               name: 'email',
//               style: Theme.of(context).textTheme.bodyMedium!.copyWith(
//                     color: Colors.black,
//                   ),
//               decoration: const InputDecoration(
//                 labelText: 'Email',
//               ),
//               validator: FormBuilderValidators.compose([
//                 FormBuilderValidators.required(),
//                 FormBuilderValidators.email(),
//               ]),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             FormBuilderTextField(
//               name: 'password',
//               style: Theme.of(context).textTheme.bodyMedium!.copyWith(
//                     color: Colors.black,
//                   ),
//               decoration: const InputDecoration(labelText: 'Password'),
//               obscureText: true,
//               validator: FormBuilderValidators.compose(
//                 [
//                   FormBuilderValidators.required(),
//                   FormBuilderValidators.minLength(6),
//                 ],
//               ),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             AppIconButton(
//               label: 'Sign up',
//               iconColor: Colors.white,
//               textColor: Colors.white,
//               icon: FontAwesomeIcons.userPlus,
//               onPressed: () {
//                 if (_formKey.currentState?.saveAndValidate() ?? false) {
//                   if (true) {
//                     // add event to bloc, user sign in with email and password
//                     debugPrint(_formKey.currentState?.value.toString());
//                     context.read<AuthenticateBloc>().add(
//                           SignUpWithEmailAndPassword(
//                             email: _formKey.currentState?.value['email'],
//                             password: _formKey.currentState?.value['password'],
//                             name: _formKey.currentState?.value['name'],
//                           ),
//                         );
//                   }
//                 }
//                 debugPrint(_formKey.currentState?.value.toString());
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
