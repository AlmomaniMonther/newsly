import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/http_exception.dart';

class CovidRequests extends ChangeNotifier {
  Map _covidResultsGlobal = {};
  Map get covidResultsGlobal {
    return _covidResultsGlobal;
  }

  Map _covidResultsByCountry = {};
  Map get covidResultsByCountry {
    return _covidResultsByCountry;
  }

  List<String> _countryList = [];
  List<String> get countryList {
    return [..._countryList];
  }

  Future<void> getCovidResultsGlobal() async {
    final url = Uri.parse('https://disease.sh/v3/covid-19/all');
    try {
      final response = await http.get(url);

      _covidResultsGlobal = await json.decode(response.body);
    } on HttpException catch (error) {
      throw error;
    }

    notifyListeners();
  }

  Future<void> getCovidStatusByCountry(String country) async {
    final url = Uri.parse(
        'https://disease.sh/v3/covid-19/countries/$country?strict=true');
    try {
      final response = await http.get(url);
      _covidResultsByCountry = json.decode(response.body);
    } on HttpException catch (error) {
      throw error;
    }

    notifyListeners();
  }

  Future<void> getSupportedCountries() async {
    final url = Uri.parse('https://disease.sh/v3/covid-19/countries');
    try {
      final response = await http.get(url);
      var result = await json.decode(response.body);
      for (var i = 0; i < result.length; i++) {
        if (result[i]['countryInfo']['iso2'] != null &&
            result[i]['countryInfo']['flag'] != null) {
          _countryList.add(result[i]['countryInfo']['iso2']);
        }
      }
    } on HttpException catch (error) {
      throw error;
    }

    notifyListeners();
  }
}
