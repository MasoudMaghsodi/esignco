import 'package:esign/screen/home/home_screen.dart';
import 'package:esign/screen/profile/login.dart';
import 'package:esign/screen/profile/profile.dart';
import 'package:esign/screen/profile/verify.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'di/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await getItInit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [Locale("fa", "IR")],
      locale: Locale("fa", "IR"),
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      // routes: {
      //   '/home': (context) => HomeScreen(),
      // },
    );
  }
}
