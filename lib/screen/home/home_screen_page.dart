import 'package:esign/constants/appbar.dart';
import 'package:esign/constants/colors.dart';
import 'package:esign/screen/home/home_page_details/category_page_one.dart';
import 'package:esign/screen/home/home_page_details/home_banner.dart';
import 'package:esign/screen/home/home_page_details/home_grid.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: PreferredSize(
        child: Appbar(
          currentRoute: HomePage(),
          height: 56,
          bottomLeftCir: 16,
          bottomRightCir: 16,
        ),
        preferredSize: Size(MediaQuery.of(context).size.width, 56.0),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: HomeBanner(),
            ),
            SizedBox(
              height: 50.0,
            ),
            Text(
              "ایزاین تجربه شیرین طراحی فرش",
              style: TextStyle(
                color: Colors.black,
                fontFamily: "Iranyekan",
                fontSize: 16,
              ),
            ),
            SizedBox(
              child: GridPhoto(),
              height: 442.397,
              width: 382.897,
            ),
            Padding(
              padding: EdgeInsets.only(top: 16.0, left: 12.0, right: 12.0),
              child: Text(
                textDirection: TextDirection.rtl,
                "برترین های دهه فجر",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Iranyekan",
                  fontSize: 16,
                ),
              ),
            ),
            CategorySellPageOne(),
          ],
        ),
      ),
    );
  }
}
