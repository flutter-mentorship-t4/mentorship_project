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
