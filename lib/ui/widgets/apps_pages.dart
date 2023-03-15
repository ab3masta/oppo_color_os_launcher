import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class AppsPages extends StatefulWidget {
  final List<Widget> appWidgets;
  const AppsPages({Key? key, required this.appWidgets}) : super(key: key);

  @override
  State<AppsPages> createState() => _AppsPagesState();
}

class _AppsPagesState extends State<AppsPages> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  final CarouselController _controller = CarouselController();
  int _current = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: CarouselSlider(
            carouselController: _controller,
            options: CarouselOptions(
              height: double.infinity,
              viewportFraction: 1.0,
              enlargeCenterPage: false,
              autoPlay: false,
              padEnds: false,
              enableInfiniteScroll: false,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              },
            ),
            items: widget.appWidgets.map((i) {
              return i;
            }).toList(),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.appWidgets.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 8.0,
                height: 8.0,
                margin:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white
                        .withOpacity(_current == entry.key ? 0.9 : 0.2)),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
