import 'package:flutter/material.dart';

Widget GridPhoto() {
  var imageList = [
    'images/design_carpet.png',
    'images/search_carpet.png',
    'images/order_carpet.png',
    'images/see_carpet.png'
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
            Expanded(child: Image.asset(imageList[index])),
            Text(textFoter[index]),
          ],
        ),
      );
    },
  );
}
