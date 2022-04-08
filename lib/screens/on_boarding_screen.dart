import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:introduction_screen/introduction_screen.dart';
import 'package:newsly/screens/home_screen.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => HomePage()),
    );
  }

  Widget _buildFullscreenImage(
    String assetName,
  ) {
    return Image.asset(
      'assets/on_boarding/$assetName',
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
    );
  }

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset('assets/on_boarding/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,

      pages: [
        PageViewModel(
          title: "Newsly",
          body:
              "Welcome to our all new app, that gives you the latest news from your favorite sources\nThe next few tips will help you navigate through our app",
          image: _buildImage('img1.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          image: _buildFullscreenImage('home.png'),
          titleWidget: const SizedBox(
            width: 0,
            height: 0,
          ),
          bodyWidget: const SizedBox(
            width: 0,
            height: 0,
          ),
          decoration: pageDecoration.copyWith(
            fullScreen: true,
            bodyFlex: 0,
            descriptionPadding: EdgeInsets.zero,
            titlePadding: EdgeInsets.zero,
            imageFlex: 3,
          ),
        ),
        PageViewModel(
          image: _buildFullscreenImage('articles.png'),
          titleWidget: const SizedBox(
            width: 0,
            height: 0,
          ),
          bodyWidget: const SizedBox(
            width: 0,
            height: 0,
          ),
          decoration: pageDecoration.copyWith(
            fullScreen: true,
            bodyFlex: 0,
            descriptionPadding: EdgeInsets.zero,
            titlePadding: EdgeInsets.zero,
            imageFlex: 3,
          ),
        ),
        PageViewModel(
          image: _buildFullscreenImage('covid.png'),
          titleWidget: const SizedBox(
            width: 0,
            height: 0,
          ),
          bodyWidget: const SizedBox(
            width: 0,
            height: 0,
          ),
          decoration: pageDecoration.copyWith(
            fullScreen: true,
            bodyFlex: 0,
            descriptionPadding: EdgeInsets.zero,
            titlePadding: EdgeInsets.zero,
            imageFlex: 3,
          ),
        ),
        PageViewModel(
          image: _buildFullscreenImage('weather.png'),
          titleWidget: const SizedBox(
            width: 0,
            height: 0,
          ),
          bodyWidget: const SizedBox(
            width: 0,
            height: 0,
          ),
          decoration: pageDecoration.copyWith(
            fullScreen: true,
            bodyFlex: 0,
            descriptionPadding: EdgeInsets.zero,
            titlePadding: EdgeInsets.zero,
            imageFlex: 3,
          ),
        ),
      ],
      onDone: () => _onIntroEnd(context),
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: false,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: true,
      //rtl: true, // Display as right-to-left
      back: const Icon(Icons.arrow_back, color: Colors.grey),

      next: const Icon(Icons.arrow_forward, color: Colors.grey),
      done: const Text('Done',
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.grey)),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        color: Colors.black87,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
      ),
    );
  }
}
