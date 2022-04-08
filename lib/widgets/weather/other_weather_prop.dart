import 'package:flutter/material.dart';

class OtherWeatherProp extends StatelessWidget {
  const OtherWeatherProp(
      {Key? key,
      required this.windSpeed,
      required this.appLanguage,
      required this.sunrise,
      required this.sunset,
      required this.humidity})
      : super(key: key);

  final String windSpeed;
  final String sunrise;
  final String sunset;
  final String humidity;
  final String? appLanguage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: FittedBox(
            child: Text(
                appLanguage == null || appLanguage == 'english'
                    ? 'Wind Speed\n$windSpeed m/s'
                    : 'سرعة الرياح\n$windSpeed m/s',
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 18,
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.w600)),
          ),
        ),
        const SizedBox(
          height: 40,
          child: VerticalDivider(
            width: 20,
            thickness: 1,
            color: Colors.black,
          ),
        ),
        Flexible(
          child: FittedBox(
            child: Text(
                appLanguage == null || appLanguage == 'english'
                    ? 'Sunrise\n$sunrise AM'
                    : 'الشروق\n$sunrise AM',
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 18,
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.w600)),
          ),
        ),
        const SizedBox(
          height: 40,
          child: VerticalDivider(
            width: 20,
            thickness: 1,
            color: Colors.black,
          ),
        ),
        Flexible(
          child: FittedBox(
            child: Text(
                appLanguage == null || appLanguage == 'english'
                    ? 'Sunset\n$sunset PM'
                    : 'الغروب\n$sunset PM',
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 18,
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.w600)),
          ),
        ),
        const SizedBox(
          height: 40,
          child: VerticalDivider(
            width: 20,
            thickness: 1,
            color: Colors.black,
          ),
        ),
        Flexible(
          child: FittedBox(
            child: Text(
              appLanguage == null || appLanguage == 'english'
                  ? 'Humidity\n$humidity %'
                  : 'الرطوبة\n$humidity %',
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 18,
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w600),
            ),
          ),
        )
      ],
    );
  }
}
