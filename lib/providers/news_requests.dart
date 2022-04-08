import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:webfeed/webfeed.dart';

import '../models/http_exception.dart';

class NewsServices extends ChangeNotifier {
  List<RssItem> _news = [];
  List<RssItem> get news {
    return [..._news];
  }

  Future<void> getNewsFeed(String path) async {
    final client = http.Client();
    String url = path;
    try {
      var response = await client.get(Uri.parse(url));
      var channel = RssFeed.parse(response.body);

      _news = channel.items!;
    } on HttpException catch (error) {
      throw error;
    }

    notifyListeners();
  }
}
