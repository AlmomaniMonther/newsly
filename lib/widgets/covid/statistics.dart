import 'package:flutter/material.dart';

class Statistics extends StatelessWidget {
  const Statistics({Key? key, required this.child}) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
      child: child,
      height: mediaQuery.size.height < 700
          ? mediaQuery.orientation == Orientation.portrait
              ? mediaQuery.size.height * 1.7 / 2
              : mediaQuery.size.width * 1.7 / 2
          : mediaQuery.orientation == Orientation.portrait
              ? mediaQuery.size.height * 1.3 / 2
              : mediaQuery.size.width * 1.3 / 2,
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 1, 0, 48),
            Color.fromARGB(255, 1, 0, 63),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }
}
