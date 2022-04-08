import 'package:flutter/material.dart';

class Covid19Widget extends StatelessWidget {
  const Covid19Widget(
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
      clipBehavior: Clip.hardEdge,
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
          width: (deviceSize.width / 2) - 36,
          height: 50,
          margin: const EdgeInsets.only(left: 16, right: 4),
        ),
        Container(
          alignment: Alignment.center,
          height: 50,
          margin: const EdgeInsets.only(left: 16, right: 4),
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
