import 'package:esign/constants/appbar.dart';
import 'package:esign/constants/colors.dart';
import 'package:esign/screen/profile/profile_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class Account extends StatelessWidget {
  const Account({Key? key}) : super(key: key);

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
      home: Scaffold(
        // bottomNavigationBar: BottomBar(),
        backgroundColor: background,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Appbar(
                currentRoute: Account(),
                height: 112.0,
                bottomLeftCir: 30.0,
                bottomRightCir: 30.0,
              ),
              SizedBox(
                height: 645,
                child: Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Card(
                    margin: EdgeInsets.only(
                        top: 75.0, left: 20.0, right: 20.0, bottom: 75.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: 1.0,
                          color: Colors.black12,
                          margin: EdgeInsets.only(
                            top: 70.0,
                          ),
                        ),
                        ListPofile(),
                        Container(
                          height: 1.0,
                          color: Colors.black12,
                          margin: EdgeInsets.only(top: 10.0),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.logout,
                                color: red,
                              ),
                              Text(
                                "خروج از حساب کاربری",
                                style: TextStyle(
                                    color: red, fontFamily: "Iranyekan"),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 25.0),
                  child: Container(
                    margin: EdgeInsets.only(top: 25.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.white),
                    height: 90.0,
                    width: 90.0,
                    child: CircleAvatar(
                      backgroundImage: AssetImage(
                        "images/default-profile.svg",
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
