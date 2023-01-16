import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../intro_screens/intro_page1.dart';
import '../intro_screens/intro_page2.dart';
import '../intro_screens/intro_page3.dart';
import 'home_page.dart';

class OnBordingScreen extends StatefulWidget {
  const OnBordingScreen({Key? key}) : super(key: key);
  _OnBordingScreenState createState() => _OnBordingScreenState();
}

class _OnBordingScreenState extends State<OnBordingScreen> {
  //keep track of if we on the last page or not

  PageController _controller = PageController();
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        PageView(
          controller: _controller,
          onPageChanged: (index) {
            setState(() {
              onLastPage = (index == 2);
            });
          },
          children: [
            IntroPageOne(),
            IntroPageTwo(),
            IntroPageThree(),
          ],
        ),
        Container(
            alignment: Alignment(0, 0.8),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // skip page
                  GestureDetector(
                      onTap: () {
                        _controller.jumpToPage(2);
                      },
                      child: Text('Skip')),
                  SmoothPageIndicator(controller: _controller, count: 3),

                  onLastPage
                      ? GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return HomePage();
                            }));
                          },
                          child: Text('Done'))
                      : GestureDetector(
                          onTap: () {
                            _controller.nextPage(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.easeIn);
                          },
                          child: Text('Next'))

                  // next page or done
                ]))
      ]),
    );
  }
}
