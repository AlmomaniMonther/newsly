import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../providers/covid_requests.dart';
import '../widgets/covid/be_safe_images.dart';
import '../widgets/covid/global_data.dart';
import '../widgets/covid/header_covid_screen.dart';
import '../widgets/covid/local_data.dart';
import '../widgets/covid/statistics.dart';
import '../widgets/covid/symptoms_images.dart';

class Covid19Screen extends StatefulWidget {
  const Covid19Screen({
    Key? key,
  }) : super(key: key);

  @override
  State<Covid19Screen> createState() => _Covid19ScreenState();
}

class _Covid19ScreenState extends State<Covid19Screen> {
  String? _chosenCountry;
  bool? _isDone;
  Map? _covidResultsGlobal;
  Map? _covidResultsByCountry;
  String? appLanguage;
  List<String>? _supportedCountries;
  bool _isLoading = false;

  void chooseCountry(String chosenCountry, bool isDone) {
    // to show the covid 19 results in the chosen country
    setState(() {
      _chosenCountry = chosenCountry;
      _isDone = isDone;
    });
  }

  Future<void> _openWHO() async {
    if (await canLaunch(
        'https://www.who.int/emergencies/diseases/novel-coronavirus-2019')) {
      await launch(
        'https://www.who.int/emergencies/diseases/novel-coronavirus-2019',
        forceWebView: true,
        enableJavaScript: true,
        enableDomStorage: true,
      );
    } else {
      throw 'Could not launch WHO site';
    }
  }

  @override
  void initState() {
    //to get the last worldwide covid 19 results and the list of supported countries in the API
    Provider.of<CovidRequests>(context, listen: false)
        .getSupportedCountries()
        .then((_) {
      Provider.of<CovidRequests>(context, listen: false)
          .getCovidResultsGlobal();
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    //to load the results and to set isLoading variable value
    //to use it to show CircularProgressIndicator
    _isLoading = true;

    _supportedCountries =
        Provider.of<CovidRequests>(context, listen: true).countryList;

    _covidResultsGlobal =
        Provider.of<CovidRequests>(context, listen: true).covidResultsGlobal;
    if (_covidResultsGlobal!.isNotEmpty) {
      _isLoading = false;
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading == false) {
      appLanguage = ModalRoute.of(context)!.settings.arguments as String;

      final mediaQuery = MediaQuery.of(context);
      print(mediaQuery.size);

      if (_chosenCountry != null && _isDone != null) {
        //load the selected country covid results if the user choose any country
        _covidResultsByCountry =
            Provider.of<CovidRequests>(context, listen: true)
                .covidResultsByCountry;
      }
      return Scaffold(
        body: SingleChildScrollView(
          primary: true,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              // CovidBackground(mediaQuery: mediaQuery),
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(bottom: 20),

                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromARGB(255, 95, 95, 95),
                      Color.fromARGB(255, 255, 254, 254),
                      Color.fromARGB(255, 131, 131, 131),
                    ],
                  ),
                ),
                child: Column(
                  children: [
                    Statistics(
                      child: Column(
                        children: [
                          HeaderCovidScreen(
                            chosenCountry: chooseCountry,
                            supportedCountries: _supportedCountries!,
                          ),
                          _chosenCountry == null && _isDone == null
                              ? Flexible(
                                  fit: FlexFit.tight,
                                  child: GlobalData(
                                      appLanguage: appLanguage,
                                      activeCases: _covidResultsGlobal![
                                              'active']
                                          .toString(),
                                      todayCases: _covidResultsGlobal![
                                              'todayCases']
                                          .toString(),
                                      totalCases: _covidResultsGlobal!['cases']
                                          .toString(),
                                      todayRecovered:
                                          _covidResultsGlobal!['todayRecovered']
                                              .toString(),
                                      totalRecovered:
                                          _covidResultsGlobal!['recovered']
                                              .toString(),
                                      todayDeaths:
                                          _covidResultsGlobal!['todayDeaths']
                                              .toString(),
                                      totalDeaths:
                                          _covidResultsGlobal!['deaths']
                                              .toString()),
                                )
                              : Flexible(
                                  fit: FlexFit.tight,
                                  child: LocalData(
                                    appLanguage: appLanguage,
                                    activeCases:
                                        _covidResultsByCountry!['active']
                                            .toString(),
                                    todayCases:
                                        _covidResultsByCountry!['todayCases']
                                            .toString(),
                                    totalCases: _covidResultsByCountry!['cases']
                                        .toString(),
                                    todayRecovered: _covidResultsByCountry![
                                            'todayRecovered']
                                        .toString(),
                                    totalRecovered:
                                        _covidResultsByCountry!['recovered']
                                            .toString(),
                                    todayDeaths:
                                        _covidResultsByCountry!['todayDeaths']
                                            .toString(),
                                    totalDeaths:
                                        _covidResultsByCountry!['deaths']
                                            .toString(),
                                    country: _chosenCountry!,
                                    flag: _covidResultsByCountry!['countryInfo']
                                        ['flag'],
                                  ),
                                ),
                        ],
                      ),
                    ),
                    SymptomsImages(
                      appLanguage: appLanguage,
                    ),
                    BeSafeImages(
                      appLanguage: appLanguage,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: GestureDetector(
                        onTap: _openWHO,
                        child: Container(
                          margin: const EdgeInsets.only(top: 20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: const LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.white,
                                    Color.fromARGB(153, 221, 221, 221)
                                  ])),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  margin: EdgeInsets.only(right: 10),
                                  width: 120,
                                  child: Text(
                                    appLanguage == null ||
                                            appLanguage == 'english'
                                        ? 'Click Here To know more about COVID-19'
                                        : 'لمعرفة المزيد عن الوباء انقر هنا',
                                    textAlign: appLanguage == null ||
                                            appLanguage == 'english'
                                        ? TextAlign.left
                                        : TextAlign.center,
                                    textDirection: appLanguage == null ||
                                            appLanguage == 'english'
                                        ? TextDirection.ltr
                                        : TextDirection.rtl,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )),
                              SizedBox(
                                  width: 200,
                                  height: 100,
                                  child: Image.asset(
                                    'assets/logos/world_health_organization.png',
                                    fit: BoxFit.contain,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                // Positioned(
                //   top: mediaQuery.orientation == Orientation.portrait
                //       ? mediaQuery.size.height * 1.5 / 2
                //       : mediaQuery.size.width * 1.5 / 2,
                //   child:
                // ),
                // Positioned(
                //   top: mediaQuery.orientation == Orientation.portrait
                //       ? mediaQuery.size.height * 1.15
                //       : mediaQuery.size.width * 1.15,
                //   child:
                // ),
              ),
            ],
          ),
        ),
      );
    } else {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
  }
}
