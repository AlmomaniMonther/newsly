import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/weather.dart';

class FiveDaysWeather extends StatelessWidget {
  const FiveDaysWeather({
    Key? key,
    required this.fiveDaysWeather,
  }) : super(key: key);

  final List<Weather> fiveDaysWeather;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      width: MediaQuery.of(context).size.width,
      height: 60,
      child: Align(
        alignment: Alignment.center,
        child: ListView.builder(
          clipBehavior: Clip.none,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: ((context, index) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '${DateFormat.E().add_Hm().format(fiveDaysWeather[index].date!)}\n${fiveDaysWeather[index].temperature!.celsius!.floor().toString()}°C',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 16,
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.w600),
                ),
                if (index < 4)
                  const SizedBox(
                    height: 40,
                    child: VerticalDivider(
                      width: 10,
                      thickness: 1,
                      color: Colors.black,
                    ),
                  ),
              ],
            );
          }),
          itemCount: 5,
        ),
      ),
    );
  }
}
