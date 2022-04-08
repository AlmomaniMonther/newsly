import 'package:flutter/material.dart';
import 'package:newsly/widgets/covid/data_container.dart';

class GlobalData extends StatelessWidget {
  const GlobalData({
    Key? key,
    required this.activeCases,
    required this.todayCases,
    required this.totalCases,
    required this.todayRecovered,
    required this.totalRecovered,
    required this.todayDeaths,
    required this.totalDeaths,
    required this.appLanguage,
  }) : super(key: key);
  final String activeCases;
  final String todayCases;
  final String totalCases;
  final String todayRecovered;
  final String totalRecovered;
  final String todayDeaths;
  final String totalDeaths;
  final String? appLanguage;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              appLanguage == null || appLanguage == 'english'
                  ? 'Global Statistics:'
                  : 'احصائيات العالم:',
              textAlign: TextAlign.start,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'WeatherIcons',
                  letterSpacing: 0),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Flexible(
          child: DataContainer(
            gradient: const LinearGradient(
              colors: [
                Color.fromARGB(255, 201, 120, 0),
                Color.fromARGB(255, 255, 153, 0),
              ],
            ),
            name: appLanguage == null || appLanguage == 'english'
                ? 'Active Cases'
                : 'الحالات الفعالة:',
            data: activeCases,
            appLanguage: appLanguage,
          ),
        ),
        Flexible(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: DataContainer(
                  name: appLanguage == null || appLanguage == 'english'
                      ? 'Today Cases'
                      : 'حالات اليوم:',
                  data: todayCases,
                  appLanguage: appLanguage,
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromARGB(255, 127, 0, 185),
                      Color.fromARGB(255, 174, 0, 255),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: DataContainer(
                  name: appLanguage == null || appLanguage == 'english'
                      ? 'Total Cases'
                      : 'اجمالي الحالات:',
                  data: totalCases,
                  appLanguage: appLanguage,
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromARGB(255, 127, 0, 185),
                      Color.fromARGB(255, 174, 0, 255),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Flexible(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: DataContainer(
                  name: appLanguage == null || appLanguage == 'english'
                      ? 'Today Recovered'
                      : 'حالات الشفاء اليوم:',
                  data: todayRecovered,
                  appLanguage: appLanguage,
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromARGB(255, 6, 192, 0),
                      Color.fromARGB(255, 9, 255, 0),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: DataContainer(
                  name: appLanguage == null || appLanguage == 'english'
                      ? 'Total Recovered'
                      : 'اجمالي حالات الشفاء:',
                  data: totalRecovered,
                  appLanguage: appLanguage,
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromARGB(255, 6, 192, 0),
                      Color.fromARGB(255, 9, 255, 0),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Flexible(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: DataContainer(
                  name: appLanguage == null || appLanguage == 'english'
                      ? 'Today Deaths'
                      : 'وفيات اليوم',
                  data: todayDeaths,
                  appLanguage: appLanguage,
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromARGB(255, 190, 38, 0),
                      Color.fromARGB(255, 255, 51, 0),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: DataContainer(
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromARGB(255, 190, 38, 0),
                      Color.fromARGB(255, 255, 51, 0),
                    ],
                  ),
                  name: appLanguage == null || appLanguage == 'english'
                      ? 'Total Deaths'
                      : 'اجمالي الوفيات:',
                  data: totalDeaths,
                  appLanguage: appLanguage,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
