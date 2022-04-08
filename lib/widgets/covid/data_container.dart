import 'package:flutter/material.dart';

class DataContainer extends StatelessWidget {
  const DataContainer(
      {Key? key,
      required this.name,
      required this.data,
      required this.appLanguage,
      required this.gradient})
      : super(key: key);
  final String name;
  final String data;
  final Gradient gradient;
  final String? appLanguage;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          gradient: gradient, borderRadius: BorderRadius.circular(10)),
      height: 90,
      width: 170,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: appLanguage == null || appLanguage == 'english'
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.end,
        children: [
          Flexible(
            child: FittedBox(
              child: Text(
                name,
                textDirection: appLanguage == null || appLanguage == 'english'
                    ? TextDirection.ltr
                    : TextDirection.rtl,
                softWrap: false,
                style: const TextStyle(
                    fontSize: 18,
                    fontFamily: 'WeatherIcons',
                    letterSpacing: 0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
          Flexible(
            child: FittedBox(
              child: Text(
                data,
                textDirection: appLanguage == null || appLanguage == 'english'
                    ? TextDirection.ltr
                    : TextDirection.rtl,
                style: const TextStyle(
                    fontSize: 16,
                    fontFamily: 'WeatherIcons',
                    letterSpacing: 0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
