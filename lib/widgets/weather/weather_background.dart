import 'package:flutter/material.dart';

class WeatherBackground extends StatelessWidget {
  const WeatherBackground({
    Key? key,
    required MediaQueryData mediaQuery,
  })  : _mediaQuery = mediaQuery,
        super(key: key);

  final MediaQueryData _mediaQuery;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: _mediaQuery.orientation == Orientation.portrait
          ? _mediaQuery.size.height < 700
              ? _mediaQuery.size.height + 2 * kToolbarHeight
              : _mediaQuery.size.height
          : _mediaQuery.size.width < 700
              ? _mediaQuery.size.width + 2 * kToolbarHeight
              : _mediaQuery.size.width,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 207, 207, 207),
            Color.fromARGB(255, 255, 254, 254),
            Color.fromARGB(255, 207, 207, 207),
          ],
        ),
      ),
    );
  }
}
