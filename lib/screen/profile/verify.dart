import 'package:esign/authentication/bloc/auth_bloc.dart';
import 'package:esign/constants/colors.dart';
import 'package:esign/constants/textfield.dart';
import 'package:esign/screen/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Verify extends StatelessWidget {
  // final TextEditingController verifycontroller;
  // Verify({TextEditingController? verifycontroller})
  //     : verifycontroller = verifycontroller ?? TextEditingController();
  final TextEditingController verifycontroller = TextEditingController();
  final token = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BlocProvider(
          create: (context) => VerifyBloc(),
          child: SafeArea(
            child: Scaffold(
              backgroundColor: background,
              appBar: AppBar(
                backgroundColor: background,
                elevation: 0.0,
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward,
                      color: black,
                    ),
                  ),
                ],
              ),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("images/enter-code.png"),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    "کد پنج رقمی ارسال شده به شماره را وارد کنید",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Iranyekan",
                        fontSize: 12),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextField(
                    controller: verifycontroller,
                  ),
                  // TextFieldWidget(),
                  SizedBox(
                    height: 20.0,
                  ),
                  BlocBuilder<VerifyBloc, VerifyState>(
                      builder: (context, state) {
                    if (state is VerifyInitiateState) {
                      return Container(
                        width: 300.0,
                        height: 40.0,
                        child: ElevatedButton(
                          onPressed: () {
                            BlocProvider.of<VerifyBloc>(context).add(
                                AuthVerifyRequest(
                                    verifycontroller.text, token));
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: purple,
                              disabledForegroundColor: Colors.white),
                          child: Text("تایید"),
                        ),
                      );
                    }

                    if (state is VerifyLodingState) {
                      return CircularProgressIndicator();
                    }
                    if (state is VerifyResponseState) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Account()),
                      );
                    }
                    return Text('خطای نا مشخص !');
                  }),
                  SizedBox(
                    height: 20.0,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: " کدی دریافت نکردید؟",
                          style: TextStyle(
                              color: Colors.black54,
                              fontFamily: "Iranyekan",
                              fontSize: 12),
                        ),
                        TextSpan(
                          text: " ارسال مجدد",
                          style: TextStyle(
                              color: purple,
                              fontFamily: "Iranyekan",
                              fontSize: 12),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}




// final snackBar = SnackBar(
                      //   backgroundColor: bgerror,
                      //   content: Align(
                      //     alignment: Alignment.centerRight,
                      //     child: const Text(
                      //       'توکن ارسال شده نامعتبر است',
                      //       style: TextStyle(
                      //           color: Colors.red,
                      //           fontFamily: "Iranyekan",
                      //           fontSize: 14),
                      //     ),
                      //   ),
                      // );
                      // ScaffoldMessenger.of(context).showSnackBar(snackBar);





// Container(
            //   width: 300.0,
            //   height: 40.0,
            //   child: ElevatedButton(
            //     onPressed: () {
            //       // final snackBar = SnackBar(
            //       //   backgroundColor: bgerror,
            //       //   content: Align(
            //       //     alignment: Alignment.centerRight,
            //       //     child: const Text(
            //       //       'توکن ارسال شده نامعتبر است',
            //       //       style: TextStyle(
            //       //           color: Colors.red,
            //       //           fontFamily: "Iranyekan",
            //       //           fontSize: 14),
            //       //     ),
            //       //   ),
            //       // );
            //       // ScaffoldMessenger.of(context).showSnackBar(snackBar);
            //     },
            //     style: ElevatedButton.styleFrom(
            //         backgroundColor: purple,
            //         disabledBackgroundColor: disabledBackground,
            //         disabledForegroundColor: Colors.white),
            //     child: Text("تایید"),
            //   ),
            // ),






 // RichText(
            //   text: TextSpan(
            //     children: [
            //       TextSpan(
            //         text: " ارسال مجدد کد تا",
            //         style: TextStyle(
            //             color: Colors.black54,
            //             fontFamily: "Iranyekan",
            //             fontSize: 12),
            //       ),
            //       TextSpan(
            //         text: " 00:00 ",
            //         style: TextStyle(
            //             color: Colors.black54,
            //             fontFamily: "Iranyekan",
            //             fontSize: 12),
            //       ),
            //       TextSpan(
            //         text: "دیگر",
            //         style: TextStyle(
            //             color: Colors.black54,
            //             fontFamily: "Iranyekan",
            //             fontSize: 12),
            //       )
            //     ],
            //   ),
            // )