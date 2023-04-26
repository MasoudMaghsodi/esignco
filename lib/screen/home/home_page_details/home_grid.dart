import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget GridPhoto() {
  var imageList = [
    'images/design_carpet.svg',
    'images/search_carpet.svg',
    'images/order_carpet.svg',
    'images/see_carpet.svg',
  ];
  var textFoter = [
    'فرش دلخواهت را طراحی کن',
    'بین هزاران فرش جستجو کن',
    'سفارش بده و بسپارش به ما',
    'فرشت رو توی فضای خونه ببین',
  ];

  return GridView.builder(
    physics: NeverScrollableScrollPhysics(),
    itemCount: imageList.length,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: 1,
    ),
    itemBuilder: (BuildContext context, int index) {
      return GridTile(
        child: Column(
          children: [
            Expanded(child: SvgPicture.asset(imageList[index])),
            Text(textFoter[index]),
          ],
        ),
      );
    },
  );
}
