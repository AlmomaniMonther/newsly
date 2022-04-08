import 'package:flutter/material.dart';

class CoverImage extends StatelessWidget {
  const CoverImage({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
        expandedHeight: 200,
        flexibleSpace: FlexibleSpaceBar(
          background: Image.asset(image, fit: BoxFit.cover),
        ));
  }
}
