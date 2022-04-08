import 'package:flutter/material.dart';

class WeatherWidget extends StatelessWidget {
  const WeatherWidget(
      {Key? key,
      required this.categoryImage,
      required this.categoryName,
      required this.deviceSize})
      : super(key: key);

  final String categoryImage;
  final String categoryName;
  final Size deviceSize;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
                image: AssetImage(
                  categoryImage,
                ),
                fit: BoxFit.cover),
          ),
          height: 50,
          margin: const EdgeInsets.only(left: 4, right: 16),
          width: (deviceSize.width / 2) - 36,
        ),
        Container(
          margin: const EdgeInsets.only(left: 4, right: 16),
          alignment: Alignment.center,
          height: 50,
          width: (deviceSize.width / 2) - 36,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5), color: Colors.black26),
          child: Text(
            categoryName,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
