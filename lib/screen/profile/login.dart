import 'package:esign/authentication/bloc/auth_bloc.dart';
import 'package:esign/constants/colors.dart';
import 'package:esign/screen/profile/verify.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);
  static const String _logoImagePath = "images/color-logo.png";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //final _mobile_controller = TextEditingController();
  late TextEditingController _mobile_controller;
  bool _isButtonDisabled = true;

  void initState() {
    super.initState();
    _mobile_controller = TextEditingController();
    _mobile_controller.addListener(() {
      final _isButtonDisabled = _mobile_controller.text.length.clamp(0, 11);
    });
  }

  void dispose() {
    _mobile_controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale("fa", "IR"), // OR Locale('ar', 'AE') OR Other RTL locales
      ],
      locale: Locale("fa", "IR"),
      home: BlocProvider(
        create: (context) => AuthBloc(),
        child: Scaffold(
          backgroundColor: background,
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: background,
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_forward,
                  color: Colors.black,
                ),
              )
            ],
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  height: 150.0,
                  width: 150.0,
                  child: Image.asset(LoginPage._logoImagePath),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "لطفا برای ورود / ثبت نام شماره موبایل خود را وارد کنید",
                style: TextStyle(
                    fontFamily: 'Iranyekan', fontSize: 12, color: black),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                width: 320.0,
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: TextField(
                    key: Key('mobile-field'),
                    controller: _mobile_controller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'شماره موبایل',
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
                if (state is AuthInitiateState) {
                  return Container(
                    width: 300.0,
                    height: 40.0,
                    child: ElevatedButton(
                      onPressed: _isButtonDisabled
                          ? () {
                              setState(() => _isButtonDisabled = false);
                              BlocProvider.of<AuthBloc>(context).add(
                                  AuthLoginRequest(_mobile_controller.text));
                            }
                          : ,
                      style: ElevatedButton.styleFrom(
                       
                          backgroundColor: purple,
                          //disabledBackgroundColor: disabledBackground,
                          disabledForegroundColor: Colors.white),
                          statesController: MaterialStatesController(MaterialColor(Colors.purple, Colors.purpleAccent)),
                          
                      child: Text("مرحله بعد"),
                    ),
                  );
                }
                if (state is AuthLodingState) {
                  return CircularProgressIndicator();
                }
                if (state is AuthResponseState) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Verify()),
                  );
                }
                return Text('خطای نا مشخص !');
              }),
              SizedBox(
                height: 20.0,
              ),
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: 'با ثبت نام در ایزاین',
                      style: TextStyle(
                          fontFamily: 'Iranyekan', fontSize: 12, color: black),
                    ),
                    TextSpan(
                        text: ' قوانین و مقررات ',
                        style: TextStyle(
                            color: purple1,
                            fontFamily: 'Iranyekan',
                            fontSize: 12)),
                    TextSpan(
                      text: 'را می پذیرم',
                      style: TextStyle(
                          fontFamily: 'Iranyekan', fontSize: 12, color: black),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
