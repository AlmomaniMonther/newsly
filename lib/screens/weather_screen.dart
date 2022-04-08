import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:weather/weather.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/weather/five_days_weather.dart';
import '../widgets/weather/other_weather_prop.dart';
import '../widgets/weather/weather_background.dart';
import '../widgets/weather/weather_texts.dart';

class WeatherScreen extends StatefulWidget {
  WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  String? appLanguage;
  late WeatherFactory weatherFactory;
  late Weather weather;
  bool _isLoading = false;
  late List<Weather> fiveDaysWeather;
  Future<void> getCurrentWeather() async {
    bool serviceEnabled;
    LocationPermission permission;
    setState(() {
      _isLoading = true;
    });

    // Check if location is enabled and enable it if it is not already enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enable location services'),
        ),
      );
    }
    // Check if location permission is granted
    permission = await Geolocator.checkPermission();
    //if location permission is denied ==> request permission
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('We don\'t have permission to access your location'),
        ),
      );
    }
    //if location permission is denied forever ==> show message to the user

    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions'),
        ),
      );
    }
    //if location permission is granted and location services is enabled
    //then the app will get the user location

    final position = await Geolocator.getCurrentPosition();
    //get the current weather by the user location
    weather = await weatherFactory.currentWeatherByLocation(
        position.latitude, position.longitude);
    // get five Days Weather by the current location
    fiveDaysWeather = await weatherFactory.fiveDayForecastByLocation(
      position.latitude,
      position.longitude,
    );

    setState(() {
      _isLoading = false;
      fetchWeatherIcon(weather);
    });
  }

  String weatherIcon = '';

  void fetchWeatherIcon(Weather _weather) {
    //fetch the weatherIcon depends on the weatherConditionCode
    var weatherConditionCode = _weather.weatherConditionCode!;
    if (weatherConditionCode < 233) {
      weatherIcon = 'assets/weather/thunderstorm.svg'; //thunderstorm
    } else if (weatherConditionCode < 322) {
      weatherIcon = 'assets/weather/drizzle.svg'; //drizzle
    } else if (weatherConditionCode <= 504) {
      weatherIcon = 'assets/weather/rain.svg'; //rain
    } else if (weatherConditionCode == 511) {
      weatherIcon = 'assets/weather/snow.svg'; //freezing rain
    } else if (weatherConditionCode < 532) {
      weatherIcon = 'assets/weather/drizzle.svg'; //drizzle
    } else if (weatherConditionCode < 632) {
      weatherIcon = 'assets/weather/snow.svg'; //freezing rain
    } else if (weatherConditionCode < 782) {
      weatherIcon = 'assets/weather/fog.svg'; //Atmosphere
    } else if (weatherConditionCode == 800) {
      weatherIcon = 'assets/weather/clear.svg'; //clear sky
    } else if (weatherConditionCode == 801) {
      weatherIcon = 'assets/weather/cloud.svg'; //few clouds: 11-25%
    } else if (weatherConditionCode == 802) {
      weatherIcon = 'assets/weather/cloud.svg'; //scattered clouds: 25-50%
    } else if (weatherConditionCode == 803) {
      weatherIcon = 'assets/weather/cloudy.svg'; //	broken clouds: 51-100%
    } else if (weatherConditionCode == 804) {
      weatherIcon = 'assets/weather/cloudy.svg'; //	broken clouds: 51-100%
    }
    setState(() {});
  }

  @override
  void didChangeDependencies() {
    appLanguage = ModalRoute.of(context)!.settings.arguments! as String?;
    //set the WeatherFactory API and the language depend on the user preferred language
    weatherFactory = WeatherFactory("01e6bdee8b08257676552c5cb6cec031",
        language: appLanguage == null || appLanguage == 'english'
            ? Language.ENGLISH
            : Language.ARABIC);
    getCurrentWeather();

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final _mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, kToolbarHeight),
        child: ClipRRect(
          borderRadius:
              const BorderRadius.vertical(bottom: Radius.circular(20)),
          child: AppBar(
            title: Text(appLanguage == null || appLanguage == 'english'
                ? 'Weather'
                : 'الطقس'),
            centerTitle: true,
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Stack(
                children: [
                  WeatherBackground(mediaQuery: _mediaQuery),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const SizedBox(
                        height: kToolbarHeight * 2.5,
                      ),
                      DateWeather(
                          date: DateFormat.yMMMd().format(weather.date!)),
                      const SizedBox(
                        height: kToolbarHeight - 20,
                      ),
                      Location(
                        area: weather.areaName!.toUpperCase(),
                        country: weather.country!.toUpperCase(),
                      ),
                      WeatherMain(
                          weatherMain: weather.weatherMain!.toUpperCase()),
                      SvgPicture.asset(
                        weatherIcon,
                        height: 140,
                        width: 140,
                      ),
                      TemperatureText(
                          temperature:
                              weather.temperature!.celsius!.floor().toString()),
                      TempMinMax(
                        appLanguage: appLanguage,
                        tempMin: weather.tempMin!.celsius!.floor().toString(),
                        tempMax: weather.tempMax!.celsius!.floor().toString(),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TempFeelsLike(
                          appLanguage: appLanguage,
                          tempFeelsLike: weather.tempFeelsLike!.celsius!
                              .floor()
                              .toString()),
                      const SizedBox(
                        height: 10,
                      ),
                      if (_isLoading == false)
                        FiveDaysWeather(fiveDaysWeather: fiveDaysWeather),
                      const SizedBox(
                        height: 20,
                      ),
                      OtherWeatherProp(
                        appLanguage: appLanguage,
                        windSpeed: weather.windSpeed!.floor().toString(),
                        sunrise: DateFormat.Hm().format(weather.sunrise!),
                        sunset: DateFormat.Hm().format(weather.sunset!),
                        humidity: weather.humidity!.floor().toString(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}


//01e6bdee8b08257676552c5cb6cec031
