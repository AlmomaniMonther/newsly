import 'package:flutter/material.dart';

class CovidBackground extends StatelessWidget {
  const CovidBackground({
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
          ? _mediaQuery.size.height * 2.1
          : _mediaQuery.size.width * 2.1,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 95, 95, 95),
            Color.fromARGB(255, 255, 254, 254),
            Color.fromARGB(255, 131, 131, 131),
          ],
        ),
      ),
    );
  }
}
