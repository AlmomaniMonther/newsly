import 'package:flutter/material.dart';

class BeSafeImages extends StatelessWidget {
  BeSafeImages({
    Key? key,
    required this.appLanguage,
  }) : super(key: key);
  final String? appLanguage;

  final List<Map<String, String>> _beSafeImagesAssets = [
    {
      'pathPic': 'assets/covid_be_safe/social_distance.png',
      'name': 'Maintaining Social Distance',
      'nameArabic': 'حافظ على التباعد الاجتماعي',
    },
    {
      'pathPic': 'assets/covid_be_safe/washing_hands.png',
      'name': 'Washing Hands',
      'nameArabic': 'اغسل يداك',
    },
    {
      'pathPic': 'assets/covid_be_safe/wearing_mask.png',
      'name': 'Wearing A Mask',
      'nameArabic': 'ارتدي الكمامة',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: appLanguage == null || appLanguage == 'english'
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.end,
        children: [
          Text(
            appLanguage == null || appLanguage == 'english'
                ? 'Prevent Getting Sick:'
                : 'للحفاظ على سلامتك:',
            textDirection: appLanguage == null || appLanguage == 'english'
                ? TextDirection.ltr
                : TextDirection.rtl,
            style: const TextStyle(
              fontSize: 22,
              fontFamily: 'WeatherIcons',
              letterSpacing: 0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2.5,
                    height: 200,
                    child: Image.asset(
                      _beSafeImagesAssets[1]['pathPic']!,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(
                      width: 120,
                      child: Text(
                        appLanguage == null || appLanguage == 'english'
                            ? _beSafeImagesAssets[1]['name']!
                            : _beSafeImagesAssets[1]['nameArabic']!,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        style: const TextStyle(
                          fontSize: 18,
                          fontFamily: 'WeatherIcons',
                          letterSpacing: 0,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2.5,
                    height: 200,
                    child: Image.asset(
                      _beSafeImagesAssets[2]['pathPic']!,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(
                      width: 120,
                      child: Text(
                        appLanguage == null || appLanguage == 'english'
                            ? _beSafeImagesAssets[2]['name']!
                            : _beSafeImagesAssets[2]['nameArabic']!,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        style: const TextStyle(
                          fontSize: 18,
                          fontFamily: 'WeatherIcons',
                          letterSpacing: 0,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ],
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 200,
                child: Image.asset(
                  _beSafeImagesAssets[0]['pathPic']!,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                  child: Text(
                appLanguage == null || appLanguage == 'english'
                    ? _beSafeImagesAssets[0]['name']!
                    : _beSafeImagesAssets[0]['nameArabic']!,
                textAlign: TextAlign.center,
                maxLines: 1,
                style: const TextStyle(
                  fontSize: 18,
                  fontFamily: 'WeatherIcons',
                  letterSpacing: 0,
                  fontWeight: FontWeight.bold,
                ),
              ))
            ],
          ),
        ],
      ),
    );
  }
}
