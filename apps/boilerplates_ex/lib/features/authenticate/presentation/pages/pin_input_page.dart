// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:pinput/pinput.dart';
// import 'package:timer_count_down/timer_count_down.dart';

// class PinInputPage extends StatefulWidget {
//   final String phoneNumber;
//   const PinInputPage({
//     super.key,
//     required this.phoneNumber,
//   });

//   static openPageFromLogin(
//     BuildContext context,
//     String phoneNumber,
//   ) {
//     Navigator.pushAndRemoveUntil(
//         context,
//         MaterialPageRoute(
//           builder: (context) => PinInputPage(
//             phoneNumber: phoneNumber,
//           ),
//         ),
//         (route) => false);
//   }

//   @override
//   State<PinInputPage> createState() => _PinInputPageState();
// }

// class _PinInputPageState extends State<PinInputPage> {
//   final pinController = TextEditingController();
//   final focusNode = FocusNode();
//   final formKey = GlobalKey<FormState>();

//   @override
//   void dispose() {
//     pinController.dispose();
//     focusNode.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     const focusedBorderColor = Color.fromRGBO(23, 171, 144, 1);
//     const fillColor = Color.fromRGBO(243, 246, 249, 0);
//     const borderColor = Color.fromRGBO(23, 171, 144, 0.4);

//     final defaultPinTheme = PinTheme(
//       width: 56,
//       height: 56,
//       textStyle: const TextStyle(
//         fontSize: 22,
//         color: Color.fromRGBO(30, 60, 87, 1),
//       ),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(19),
//         border: Border.all(color: borderColor),
//       ),
//     );

//     /// Optionally you can use form to validate the Pinput
//     return Scaffold(
//       body: Form(
//         key: formKey,
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(15),
//                 child: Text(
//                   'A code has been sent to\n${widget.phoneNumber}\nPlease enter the code to continue.',
//                   style: Theme.of(context).textTheme.headlineSmall,
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Directionality(
//                 // Specify direction if desired
//                 textDirection: TextDirection.ltr,
//                 child: Pinput(
//                   controller: pinController,
//                   focusNode: focusNode,
//                   androidSmsAutofillMethod:
//                       AndroidSmsAutofillMethod.smsUserConsentApi,
//                   listenForMultipleSmsOnAndroid: true,
//                   defaultPinTheme: defaultPinTheme,
//                   separatorBuilder: (index) => const SizedBox(width: 8),
//                   validator: (value) {
//                     return value == '2222' ? null : 'Pin is incorrect';
//                   },
//                   onClipboardFound: (value) {
//                     debugPrint('onClipboardFound: $value');
//                     pinController.setText(value);
//                   },
//                   hapticFeedbackType: HapticFeedbackType.lightImpact,
//                   onCompleted: (pin) {
//                     debugPrint('onCompleted: $pin');
//                   },
//                   onChanged: (value) {
//                     debugPrint('onChanged: $value');
//                   },
//                   cursor: Column(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       Container(
//                         margin: const EdgeInsets.only(bottom: 9),
//                         width: 22,
//                         height: 1,
//                         color: focusedBorderColor,
//                       ),
//                     ],
//                   ),
//                   focusedPinTheme: defaultPinTheme.copyWith(
//                     decoration: defaultPinTheme.decoration!.copyWith(
//                       borderRadius: BorderRadius.circular(8),
//                       border: Border.all(color: focusedBorderColor),
//                     ),
//                   ),
//                   submittedPinTheme: defaultPinTheme.copyWith(
//                     decoration: defaultPinTheme.decoration!.copyWith(
//                       color: fillColor,
//                       borderRadius: BorderRadius.circular(19),
//                       border: Border.all(color: focusedBorderColor),
//                     ),
//                   ),
//                   errorPinTheme: defaultPinTheme.copyBorderWith(
//                     border: Border.all(color: Colors.redAccent),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               ElevatedButton.icon(
//                 icon: const Icon(
//                   FontAwesomeIcons.check,
//                   color: Colors.white,
//                 ),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.green,
//                 ),
//                 onPressed: () {
//                   focusNode.unfocus();
//                   formKey.currentState!.validate();
//                 },
//                 label: const Text(
//                   'Validate',
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ),
//               const Padding(
//                 padding: EdgeInsets.all(8.0),
//                 child: Divider(),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text('Din\'t receive the code? Code will resend in  '),
//                   Countdown(
//                     seconds: 55,
//                     build: (
//                       BuildContext context,
//                       double time,
//                     ) =>
//                         Text(time.round().toString()),
//                     interval: const Duration(milliseconds: 100),
//                     onFinished: () {
//                       // execute resend code
//                     },
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
