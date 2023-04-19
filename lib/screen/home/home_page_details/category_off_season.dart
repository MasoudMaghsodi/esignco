import 'package:esign/network/image_api.dart';
import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';

class CategoryOffSeason extends StatefulWidget {
  const CategoryOffSeason({Key? key}) : super(key: key);

  @override
  State<CategoryOffSeason> createState() => _CategoryOffSeasonState();
}

class _CategoryOffSeasonState extends State<CategoryOffSeason> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getOffSeason(),
      builder: (context, snapshot) {
        Map? data = snapshot.data;
        if (snapshot.hasError) {
          return const Center(
            child: Text('An error has occurred!'),
          );
        } else if (snapshot.hasData) {
          return CarouselSlider.builder(
            options: CarouselOptions(
              autoPlay: true,
              disableCenter: false,
              padEnds: false,
              height: 420.0,
              viewportFraction: 0.9,
              enableInfiniteScroll: false,
            ),
            itemCount: data!['data']['products'][0]['images'].length,
            itemBuilder: (context, index, realIndex) {
              return Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Container(
                      height: 360.0,
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 4.0),
                      child: Image.network(
                        '${data['data']['products'][0]['images'][index]['thumbnailUrl']}',
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
