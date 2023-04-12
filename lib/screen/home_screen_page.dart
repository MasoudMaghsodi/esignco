import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/home_banner/bloc/home_bloc.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Text('hi this is home page'),
//       ),
//     );
//   }
// }

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    BlocProvider.of<HomeBloc>(context).add(HomeGetInitilzeData());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return CustomScrollView(
            slivers: [
              if (state is HomeLoadingState) ...{
                SliverToBoxAdapter(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: const [
                      SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(),
                      ),
                    ],
                  ),
                )
              } else ...{
                _getSearchBox(),
                if (state is HomeRequestSuccessState) ...[
                  state.bannerList.fold((exceptionMessage) {
                    return SliverToBoxAdapter(child: Text(exceptionMessage));
                  }, (listBanners) {
                    return _getBanners(listBanners.cast<Banner>());
                  })
                ],
              },
            ],
          );
        },
      )),
    );
  }
}

class _getBanners extends StatelessWidget {
  List<Banner> bannerCampain;
  _getBanners(
    this.bannerCampain, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BannerSlider(bannerCampain),
    );
  }
}

class _getSearchBox extends StatelessWidget {
  const _getSearchBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(left: 44, right: 44, bottom: 32),
        child: Container(
          height: 46,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          child: Row(
            children: [
              const SizedBox(
                width: 16,
              ),
              Image.asset('assets/images/icon_search.png'),
              const SizedBox(
                width: 10,
              ),
              const Expanded(
                child: Text(
                  'جستجوی محصولات',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontFamily: 'sb', fontSize: 16, color: Colors.amber),
                ),
              ),
              Image.asset('assets/images/icon_apple_blue.png'),
              const SizedBox(
                width: 16,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class BannerSlider extends StatelessWidget {
  List<Banner> bannerList;
  BannerSlider(this.bannerList, {super.key});

  @override
  Widget build(BuildContext context) {
    var controller = PageController(viewportFraction: 0.9);

    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        SizedBox(
          height: 177,
          child: PageView.builder(
              controller: controller,
              itemCount: bannerList.length,
              itemBuilder: ((context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 6),
                  child: CachedImage(
                    imageUrl: bannerList[index].thumbnail,
                    radius: 15,
                  ),
                );
              })),
        ),
      ],
    );
  }
}
