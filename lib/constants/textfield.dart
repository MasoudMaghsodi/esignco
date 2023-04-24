// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:pin_code_fields/pin_code_fields.dart';

// class TextFieldWidget extends StatefulWidget {
//   // final String? phonenumber;
//   // const TextFieldWidget({
//   //   Key? key,
//   //   this.phonenumber,
//   // }) : super(key: key);

//   @override
//   State<TextFieldWidget> createState() => _TextFieldWidgetState();
// }

// class _TextFieldWidgetState extends State<TextFieldWidget> {
//   TextEditingController textEditingController = TextEditingController();

//   StreamController<ErrorAnimationType>? errorController;
//   bool hasError = false;
//   String currentText = "";
//   final formKey = GlobalKey<FormState>();
//   final TextEditingController verifycontroller = TextEditingController();

//   @override
//   void initState() {
//     errorController = StreamController<ErrorAnimationType>();
//     super.initState();
//   }

//   @override
//   void dispose() {
//     errorController!.close();

//     super.dispose();
//   }

//   snackBar(String? message) {
//     return ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(message!),
//         duration: const Duration(seconds: 2),
//       ),
//     );
//   }

//   Widget build(BuildContext context) {
//     return Form(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20.0),
//         child: PinCodeTextField(
//           controller: verifycontroller,
//           keyboardType: TextInputType.number,
//           length: 5,
//           appContext: context,
//           pastedTextStyle: TextStyle(
//             fontWeight: FontWeight.bold,
//           ),
//           onChanged: (value) {
//             debugPrint(value);
//             setState(() {
//               currentText = value;
//             });
//           },
//           cursorColor: Colors.black12,
//           pinTheme: PinTheme(
//             shape: PinCodeFieldShape.box,
//             borderRadius: BorderRadius.circular(5),
//             activeColor: Colors.black12,
//             inactiveColor: Colors.black12,
//             disabledColor: Colors.black12,
//             selectedColor: Colors.black12,
//             fieldHeight: 48.0,
//             fieldWidth: 48.0,
//           ),
//         ),
//       ),
//     );
//   }
// }
