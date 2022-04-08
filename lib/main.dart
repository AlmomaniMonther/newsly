import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'models/http_exception.dart';
import 'providers/news_requests.dart';
import 'screens/about_us_screen.dart';
import 'screens/feedback_screen.dart';
import 'screens/home_screen.dart';
import 'screens/on_boarding_screen.dart';
import 'screens/weather_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webfeed/webfeed.dart';
import 'providers/covid_requests.dart';
import 'package:workmanager/workmanager.dart';
import 'package:http/http.dart' as http;

import 'screens/covid19_screen.dart';

const fetchBackground = "fetchBackground";

Future _showNotificationWithDefaultSound(flip, RssItem? lastNews) async {
  // Show a notification after every 15 minute with the first
  // appearance happening a minute after invoking the method
  var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
      'last news', 'breaking news',
      channelDescription:
          'show a notification every 30 minutes with the last item in the chosen RSS channel',
      importance: Importance.max,
      priority: Priority.high);

  // initialize channel platform for both Android and iOS device.
  var platformChannelSpecifics = NotificationDetails(
    android: androidPlatformChannelSpecifics,
  );
  if (lastNews != null) {
    await flip.show(
        0, 'Breaking News \u{1F525}', lastNews.title!, platformChannelSpecifics,
        payload: 'Default_Sound');
  } else {
    await flip.show(
        0,
        'Greetings \u{2764}',
        'Thank you for using my app \u{1F604}\nHope you enjoy it! \u{1F609}',
        platformChannelSpecifics,
        payload: 'Default_Sound');
  }
}

void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    switch (task) {

      // Code to run in background
      case fetchBackground:
        try {
          RssItem? lastNews;

          final prefs = await SharedPreferences.getInstance();

          final notifications = prefs.getString('notifications');
          if (notifications != null && notifications.isNotEmpty) {
            final client = http.Client();
            String url = notifications;

            var response = await client.get(Uri.parse(url));
            var channel = RssFeed.parse(response.body);

            lastNews = channel.items!.first;
          } else if (notifications == null || notifications.isEmpty) {
            lastNews = null;
          }
          // initialize the plugin of flutterLocalNotifications.
          FlutterLocalNotificationsPlugin flip =
              FlutterLocalNotificationsPlugin();

          // app_icon needs to be a added as a drawable
          // resource to the Android head project.
          var android =
              const AndroidInitializationSettings('@mipmap/launcher_icon');

          // initialize settings for both Android and iOS device.
          var settings = InitializationSettings(
            android: android,
          );
          flip.initialize(settings);
          _showNotificationWithDefaultSound(flip, lastNews);
        } on HttpException catch (error) {
          print('error1 $error');
        } catch (error) {
          print('error2 $error');
        }
        break;
    }

    return Future.value(true);
  });
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Workmanager().initialize(
    // The top level function, aka callbackDispatcher
    callbackDispatcher,

    // If enabled it will post a notification whenever
    // the task is running. Handy for debugging tasks
    isInDebugMode: false,
  );
  // Periodic task registration
  Workmanager().registerPeriodicTask(
    "2",

    //This is the value that will be
    // returned in the callbackDispatcher
    fetchBackground,

    // Frequency of the background task
    frequency: const Duration(minutes: 30),
    constraints: Constraints(
      networkType: NetworkType.connected,
    ),
  );
  bool isFirstTime = false;
  await SharedPreferences.getInstance().then((prefs) {
    final bool firstTime = prefs.getBool('firstTime') ?? true;
    if (firstTime == true) {
      //show dialog for one time only

      prefs.setBool("firstTime", false);
      isFirstTime = true;
    }
  });
  runApp(MyApp(
    isFirstTime: isFirstTime,
  ));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key, required this.isFirstTime}) : super(key: key);
  bool isFirstTime;

  Map<int, Color> mainColor = {
    50: const Color.fromARGB(0, 53, 53, 53),
    100: const Color.fromARGB(30, 53, 53, 53),
    200: const Color.fromARGB(60, 53, 53, 53),
    300: const Color.fromARGB(90, 53, 53, 53),
    400: const Color.fromARGB(120, 53, 53, 53),
    500: const Color.fromARGB(150, 53, 53, 53),
    600: const Color.fromARGB(180, 53, 53, 53),
    700: const Color.fromARGB(210, 53, 53, 53),
    800: const Color.fromARGB(230, 53, 53, 53),
    900: const Color.fromARGB(255, 53, 53, 53),
  };

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => NewsServices(),
        ),
        ChangeNotifierProvider(
          create: (context) => CovidRequests(),
        ),
      ],
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Newsly',
          theme: ThemeData(
            // This is the theme of the application.

            primarySwatch: MaterialColor(0xFF686868, mainColor),
          ),
          home: isFirstTime == true ? OnBoardingPage() : HomePage(),
          routes: {
            '/feedbackScreen': (context) => const FeedbackScreen(),
            '/aboutUsScreen': (context) => const AboutUsScreen(),
            '/covid19Screen': (context) => const Covid19Screen(),
            '/weatherScreen': (context) => WeatherScreen(),
          },
        );
      },
    );
  }
}
