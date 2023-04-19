import 'package:esign/screen/home/home_screen_page.dart';
import 'package:esign/screen/profile/login.dart';
import 'package:esign/screen/profile/profile.dart';
import 'package:flutter/material.dart';
import 'colors.dart';

class Appbar extends StatelessWidget {
  final Widget currentRoute;
  final double height;
  final double bottomLeftCir;
  final double bottomRightCir;
  const Appbar(
      {super.key,
      this.height = 0,
      this.bottomLeftCir = 0,
      this.bottomRightCir = 0,
      required this.currentRoute});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppBar(
        elevation: 0,
        leadingWidth: MediaQuery.of(context).size.width,
        backgroundColor: purple,
        toolbarHeight: 112.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(bottomLeftCir),
            bottomRight: Radius.circular(bottomRightCir),
          ),
        ),
        title: Align(
          child: Container(
            height: height,
            width: MediaQuery.of(context).size.width,
            child: Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                          );

                          Navigator.of(
                            context,
                            rootNavigator: true,
                          ).pop(
                            context,
                          );
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                          );
                          Navigator.of(
                            context,
                            rootNavigator: true,
                          ).pop(
                            context,
                          );
                        },
                        icon: Image.asset("images/logo.png"),
                      ),
                      Expanded(
                        flex: 1,
                        child: SizedBox.shrink(),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.shopping_cart_outlined,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        onPressed: currentRoute == Account()
                            ? null
                            : () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginPage(),
                                  ),
                                ),
                        icon: Icon(
                          Icons.person_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
