import 'package:flutter/material.dart';

import '../covid_cat_wedgit.dart';
import '../weather_cat_wedgit.dart';

class SubCategories extends StatelessWidget {
  SubCategories({required this.appLanguage, Key? key}) : super(key: key);
  String? appLanguage;
  List<Map<String, String>> subCategories = [
    {
      'categoryName': 'Covid-19',
      'categoryNameArabic': 'فايروس كورونا',
      'categoryImage': 'assets/sub_categories/covid19.jpg',
    },
    {
      'categoryName': 'Weather',
      'categoryNameArabic': 'الطقس',
      'categoryImage': 'assets/sub_categories/weather.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final _deviceSize = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context)
                .pushNamed('/covid19Screen', arguments: appLanguage);
          },
          child: Covid19Widget(
              categoryImage: subCategories[0]['categoryImage']!,
              categoryName: appLanguage == null || appLanguage == 'english'
                  ? subCategories[0]['categoryName']!
                  : subCategories[0]['categoryNameArabic']!,
              deviceSize: _deviceSize),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context)
                .pushNamed('/weatherScreen', arguments: appLanguage);
          },
          child: WeatherWidget(
              categoryImage: subCategories[1]['categoryImage']!,
              categoryName: appLanguage == null || appLanguage == 'english'
                  ? subCategories[1]['categoryName']!
                  : subCategories[1]['categoryNameArabic']!,
              deviceSize: _deviceSize),
        ),
      ],
    );
  }
}
