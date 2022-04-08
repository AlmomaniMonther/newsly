import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/covid_requests.dart';
import '../../screens/home_screen.dart';

typedef void Callback(String chosenCountry, bool isDone);

class HeaderCovidScreen extends StatelessWidget {
  const HeaderCovidScreen(
      {Key? key, required this.chosenCountry, required this.supportedCountries})
      : super(key: key);
  final List<String> supportedCountries;
  final Callback chosenCountry;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => HomePage()),
            );
          },
          icon: const Icon(
            Icons.arrow_back,
          ),
          color: Colors.white,
          iconSize: 30,
        ),
        const Text(
          'Covid-19',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 28,
              letterSpacing: 0,
              fontWeight: FontWeight.w500,
              color: Colors.white),
        ),
        IconButton(
          onPressed: () {
            showCountryPicker(
                context: context,
                countryFilter: supportedCountries,
                countryListTheme: const CountryListThemeData(
                  backgroundColor: Color.fromARGB(255, 214, 214, 214),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                onSelect: (value) {
                  Provider.of<CovidRequests>(context, listen: false)
                      .getCovidStatusByCountry(value.countryCode)
                      .then((_) {
                    chosenCountry(
                      value.name,
                      true,
                    );
                  });
                });
          },
          icon: const Icon(
            Icons.public,
          ),
          color: Colors.white,
          iconSize: 30,
        )
      ],
    );
  }
}
