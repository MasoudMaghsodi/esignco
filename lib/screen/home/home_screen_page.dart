import 'package:esign/constants/appbar.dart';
import 'package:esign/constants/colors.dart';
import 'package:esign/screen/home/home_page_details/category_dahe_fajr.dart';
import 'package:esign/screen/home/home_page_details/category_new.dart';
import 'package:esign/screen/home/home_page_details/category_off_season.dart';
import 'package:esign/screen/home/home_page_details/home_banner.dart';
import 'package:esign/screen/home/home_page_details/home_grid.dart';
import 'package:esign/screen/home/home_page_details/information.dart';
import 'package:esign/screen/home/home_page_details/videoHomePage.dart';
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
            Container(
              margin: EdgeInsets.symmetric(vertical: 32, horizontal: 12.0),
              alignment: Alignment.centerRight,
              child: Text(
                'برترین های دهه فجر',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Iranyekan",
                  fontSize: 16,
                ),
              ),
            ),
            CategorySellPageOne(),
            Container(
              margin: EdgeInsets.symmetric(vertical: 32, horizontal: 12.0),
              alignment: Alignment.centerRight,
              child: Text(
                'ایزاین چیست؟',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Iranyekan",
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              width: 370.897,
              height: 448.155,
              child: VideoPlayerExample(),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 32, horizontal: 12.0),
              alignment: Alignment.centerRight,
              child: Text(
                'تخفیف فصل',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Iranyekan",
                  fontSize: 16,
                ),
              ),
            ),
            Container(
              height: 489.15,
              width: 532,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.white,
              ),
              child: CategoryOffSeason(),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 32, horizontal: 12.0),
              alignment: Alignment.centerRight,
              child: Text(
                'جدید ترین محصولات',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Iranyekan",
                  fontSize: 16,
                ),
              ),
            ),
            Container(
              height: 489.15,
              width: 532,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.white,
              ),
              child: CategoryNew(),
            ),
            SizedBox(
              height: 20.0,
            ),
            HomeList()
          ],
        ),
      ),
    );
  }
}
