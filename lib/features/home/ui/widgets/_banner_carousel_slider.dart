part of '../home_screen.dart';

class _BannerCarouselSlider extends StatelessWidget {
  const _BannerCarouselSlider();

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      options: CarouselOptions(
        height: 125.h,
        viewportFraction: 0.75,
        enlargeFactor: 0.25,
        enableInfiniteScroll: true,
        autoPlay: true,
        enlargeCenterPage: true,
        // onPageChanged: (int index, CarouselPageChangedReason reason) {},
      ),
      itemCount: 3,
      itemBuilder: (context, index, realIndex) {
        return ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(16.r)),
          child: Container(
            // margin: EdgeInsets.symmetric(horizontal: 10),
            color: Colors.red,
            child: Image.asset(
              'assets/images/ad1.jpg',
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}

/**
 *
    CarouselSlider.builder(
    options: CarouselOptions(),
    itemCount: 15,
    itemBuilder:
    (BuildContext context, int itemIndex, int pageViewIndex) =>
    Container(
    child: Text(itemIndex.toString()),
    ),
    ),
    CarouselSlider(
    items: items,
    options: CarouselOptions(
    height: 400,
    aspectRatio: 16 / 9,
    viewportFraction: 0.8,
    initialPage: 0,
    enableInfiniteScroll: true,
    reverse: false,
    autoPlay: true,
    autoPlayInterval: Duration(seconds: 3),
    autoPlayAnimationDuration: Duration(milliseconds: 800),
    autoPlayCurve: Curves.fastOutSlowIn,
    enlargeCenterPage: true,
    enlargeFactor: 0.3,
    onPageChanged: callbackFunction,
    scrollDirection: Axis.horizontal,
    ),
    ),
 *
 * */
