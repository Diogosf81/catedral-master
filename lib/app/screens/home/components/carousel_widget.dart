import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class CarouselWidget extends StatefulWidget {
  const CarouselWidget({Key? key}) : super(key: key);

  @override
  State<CarouselWidget> createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  List<String> _carouselImages = [];
  var _dotPosition = 0;

  carouselImages() async {
    var _firestoreInstance = FirebaseFirestore.instance;
    QuerySnapshot qn = await _firestoreInstance.collection("destaques").get();
    setState(() {
      for (int i = 0; i < qn.docs.length; i++) {
        _carouselImages.add(
          qn.docs[i]["img"],
        );
      }
    });
    return qn.docs;
  }

  @override
  void initState() {
    carouselImages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items:
          //_carouselImages.length == 0
              _carouselImages
                  .map((item) => Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(item),
                                fit: BoxFit.fitWidth)),
                      ))
                  .toList(),
              // : _carouselImages
              //     .map((item) => Container(
              //           width: MediaQuery.of(context).size.width,
              //           height: 90,
              //           child: Center(
              //             child: Column(
              //               mainAxisAlignment: MainAxisAlignment.center,
              //               children: [
              //                 Icon(Icons.cloud_off, color: Colors.grey),
              //                 Text(
              //                     "Ocorreu um erro no carregamento.\nVerifique sua internet!",
              //                     style: TextStyle(color: Colors.grey),
              //                     textAlign: TextAlign.center),
              //               ],
              //             ),
              //           ),
              //         ))
              //     .toList(),
          options: CarouselOptions(
              height: 140,
              autoPlay: true,
              viewportFraction: 1,
              onPageChanged: (val, carouselPageChangeReason) {
                setState(() {
                  _dotPosition = val;
                });
              }),
        ),
        DotsIndicator(
          dotsCount: _carouselImages.length == 0 ? 1 : _carouselImages.length,
          position: _dotPosition.toDouble(),
          decorator: DotsDecorator(
              activeColor: Color.fromARGB(255, 221, 255, 231),
              color: Color.fromARGB(255, 22, 125, 127),
              spacing: EdgeInsets.all(2),
              activeSize: Size(8, 8),
              size: Size(6, 6)),
        ),
      ],
    );
  }
}
