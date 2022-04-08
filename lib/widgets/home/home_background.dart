import 'package:flutter/material.dart';

class HomeBackground extends StatelessWidget {
  const HomeBackground({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _mediaQuery = MediaQuery.of(context);
    return Container(
      width: double.infinity,
      height: _mediaQuery.orientation == Orientation.portrait
          ? _mediaQuery.size.height + (1.5 * kToolbarHeight)
          : _mediaQuery.size.width / 1.5,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 90, 90, 90),
            Color.fromARGB(255, 0, 0, 0),
            Color.fromARGB(255, 90, 90, 90),
          ],
        ),
      ),
    );
  }
}
