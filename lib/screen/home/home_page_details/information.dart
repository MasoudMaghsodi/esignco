import 'package:esign/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:simple_icons/simple_icons.dart';

class HomeList extends StatefulWidget {
  const HomeList({super.key});

  @override
  State<HomeList> createState() => _HomeListState();
}

class _HomeListState extends State<HomeList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 13.0),
          alignment: Alignment.centerRight,
          child: Text(
            ' با اطلاعات فرش بیشتر آشنا شو!',
            textAlign: TextAlign.right,
            style: TextStyle(
              color: Colors.black,
              fontFamily: "Iranyekan",
              fontSize: 16,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {},
          child: Text('مشاهده بلاگ', style: TextStyle(color: purple)),
          style: ElevatedButton.styleFrom(
            backgroundColor: background,
            elevation: 0,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: purple,
                style: BorderStyle.solid,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            shadowColor: purple,
          ),
        ),
        SizedBox(
          height: 24,
        ),
        AboutMe(),
      ],
    );
  }
}

class AboutMe extends StatefulWidget {
  const AboutMe({super.key});

  @override
  State<AboutMe> createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
  bool _isTapped = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundinfo,
      width: 382.897,
      height: 483.310,
      padding: EdgeInsets.fromLTRB(16, 32, 16, 48),
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            width: 374.897,
            height: 44.086,
            child: Text(
              'سوالی دارید؟ تماس بگیرید        22412263-021',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'iranyekan',
                fontSize: 14,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          getUnderline(),
          infoButton('درباره ما'),
          getUnderline(),
          infoButton('تماس با ما'),
          getUnderline(),
          infoButton('بافت فرش سفارشی'),
          getUnderline(),
          infoButton('پاسخ به پرسش های متداول'),
          getUnderline(),
          infoButton('قوانین و مقررات'),
          getUnderline(),
          infoButton('ارتباط با ما'),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      SimpleIcons.whatsapp,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      SimpleIcons.telegram,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      SimpleIcons.aparat,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      SimpleIcons.instagram,
                      color: Colors.grey.shade600,
                    ),
                  )
                ],
              ),
              Text(
                'نماد اعتماد الکترونیکی',
                style: TextStyle(
                  color: _isTapped ? purple : Colors.white,
                  fontFamily: 'iranyekan',
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget getUnderline() {
    return Container(
      color: Colors.white,
      width: 374.897,
      height: 0.5,
    );
  }

  Widget infoButton(String text) {
    return Container(
      alignment: Alignment.centerRight,
      width: 374.897,
      height: 44.086,
      child: GestureDetector(
        onTap: () {
          setState(() {
            _isTapped = !_isTapped;
          });
        },
        child: Text(
          text,
          style: TextStyle(
            color: _isTapped ? purple : Colors.white,
            fontFamily: 'iranyekan',
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
