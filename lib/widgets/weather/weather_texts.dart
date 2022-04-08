import 'package:flutter/material.dart';

class TempFeelsLike extends StatelessWidget {
  const TempFeelsLike({
    Key? key,
    required this.tempFeelsLike,
    required this.appLanguage,
  }) : super(key: key);

  final String tempFeelsLike;
  final String? appLanguage;

  @override
  Widget build(BuildContext context) {
    return Text(
        appLanguage == null || appLanguage == 'english'
            ? 'Feels Like: $tempFeelsLike°C'
            : 'الحرارة الملموسة: $tempFeelsLike°C',
        textDirection: appLanguage == null || appLanguage == 'english'
            ? TextDirection.ltr
            : TextDirection.rtl,
        style: const TextStyle(
            fontSize: 16, fontFamily: 'OpenSans', fontWeight: FontWeight.w600));
  }
}

class TempMinMax extends StatelessWidget {
  const TempMinMax(
      {Key? key,
      required this.appLanguage,
      required this.tempMin,
      required this.tempMax})
      : super(key: key);

  final String tempMin;
  final String tempMax;
  final String? appLanguage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
            appLanguage == null || appLanguage == 'english'
                ? 'Min\n$tempMin°C'
                : 'الصغرى\n$tempMin°C',
            style: const TextStyle(
              fontSize: 24,
            )),
        const SizedBox(
          height: 50,
          child: VerticalDivider(
            width: 20,
            thickness: 1,
            color: Colors.black,
          ),
        ),
        Text(
            appLanguage == null || appLanguage == 'english'
                ? 'Max\n$tempMax°C'
                : 'العظمى\n$tempMax°C',
            style: const TextStyle(
              fontSize: 24,
            )),
      ],
    );
  }
}

class TemperatureText extends StatelessWidget {
  const TemperatureText({Key? key, required this.temperature})
      : super(key: key);
  final String temperature;
  @override
  Widget build(BuildContext context) {
    return Text('$temperature°C',
        style: const TextStyle(fontSize: 70, fontWeight: FontWeight.bold));
  }
}

class WeatherMain extends StatelessWidget {
  const WeatherMain({Key? key, required this.weatherMain}) : super(key: key);
  final String weatherMain;
  @override
  Widget build(BuildContext context) {
    return Text(weatherMain,
        style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w500,
            fontFamily: 'WeatherIcons',
            letterSpacing: -1));
  }
}

class Location extends StatelessWidget {
  const Location({Key? key, required this.area, required this.country})
      : super(key: key);

  final String area;
  final String country;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Text('$area,$country',
          style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w900,
              fontFamily: 'WeatherIcons',
              letterSpacing: 3)),
    );
  }
}

class DateWeather extends StatelessWidget {
  DateWeather({Key? key, required this.date}) : super(key: key);
  String date;
  @override
  Widget build(BuildContext context) {
    return Text('"$date"',
        style: const TextStyle(
            fontSize: 20, fontFamily: 'OpenSans', fontWeight: FontWeight.w600));
  }
}
