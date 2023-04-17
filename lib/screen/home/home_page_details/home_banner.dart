import 'package:flutter/material.dart';

import 'package:esign/network/image_api.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getPics(),
      builder: (context, snapshot) {
        Map? data = snapshot.data;
        if (snapshot.hasError) {
          return const Center(
            child: Text('An error has occurred!'),
          );
        } else if (snapshot.hasData) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 12.0),
            width: MediaQuery.of(context).size.width,
            child: CarouselSlider.builder(
              options: CarouselOptions(
                disableCenter: false,
                padEnds: false,
                height: 184.0,
                viewportFraction: 0.9,
                enableInfiniteScroll: false,
              ),
              itemCount: data!['data']['result'].length,
              itemBuilder: (context, index, realIndex) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(
                    '${data['data']['result'][index]['imageSmall']}',
                    fit: BoxFit.fill,
                  ),
                );
              },
            ),
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
