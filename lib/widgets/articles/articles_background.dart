import 'package:flutter/material.dart';

class ArticlesBackground extends StatelessWidget {
  const ArticlesBackground({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
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
