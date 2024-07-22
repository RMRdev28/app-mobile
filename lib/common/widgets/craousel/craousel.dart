import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:plv/common/widgets/craousel/craousel_image.dart';

class Craousel extends StatelessWidget {
  const Craousel({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> imgList = [
      'https://upload.wikimedia.org/wikipedia/commons/4/41/Sunflower_from_Silesia2.jpg',
      'https://onlinejpgtools.com/images/examples-onlinejpgtools/sunflower.jpg',
      'https://png.pngtree.com/thumb_back/fh260/background/20230527/pngtree-old-classic-car-art-in-the-woods-17-jpg-files-in-image_2671047.jpg',
    ];
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: CarouselSlider(
        options: CarouselOptions(
          height: 200.0,
          autoPlay: true,
          viewportFraction: 1.0,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          pauseAutoPlayOnTouch: true,
          aspectRatio: 2.0,
        ),
        items:
            imgList.map((item) => CraouselImage(imageNetwork: item)).toList(),
      ),
    );
  }
}
