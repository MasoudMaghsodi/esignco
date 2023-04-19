import 'package:esign/constants/colors.dart';
import 'package:flutter/material.dart';

Widget ListPofile() {
  List<String> titleText = [
    "حساب کاربری",
    "گالری",
    "سفارشات من",
    "تراکنش ها",
    "درخواست فرش سفارشی",
    "پشتیبانی",
  ];

  List<IconData> iconList = [
    Icons.person_outlined,
    Icons.collections_bookmark_outlined,
    Icons.shopping_bag_outlined,
    Icons.receipt_long_outlined,
    Icons.domain_verification_rounded,
    Icons.support_agent_outlined,
  ];

  return ListView.builder(
    padding: EdgeInsets.only(top: 10),
    physics: NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    itemCount: titleText.length,
    itemBuilder: (BuildContext context, int index) {
      return ListTile(
        onTap: () {},
        leading: Icon(
          iconList[index],
          color: black,
        ),
        title: Text(titleText[index]),
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: 15.0,
        ),
      );
    },
  );
}
