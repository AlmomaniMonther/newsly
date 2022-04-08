import 'package:flutter/material.dart';

class NotificationsSourcesList {
  List<DropdownMenuItem<String>> englishNotificationSources = const [
    DropdownMenuItem(
      child: Text(
        'BBC-News',
      ),
      value: 'http://feeds.bbci.co.uk/news/world/rss.xml',
    ),
    DropdownMenuItem(
      child: Text('CNN'),
      value: 'http://rss.cnn.com/rss/edition_world.rss',
    ),
    DropdownMenuItem(
      child: Text('Deutsche Welle'),
      value: 'https://rss.dw.com/rdf/rss-en-world',
    ),
    DropdownMenuItem(
      child: Text('France 24'),
      value: 'https://www.france24.com/en/rss',
    ),
    DropdownMenuItem(
      child: Text('New York Times'),
      value: 'https://rss.nytimes.com/services/xml/rss/nyt/World.xml',
    ),
    DropdownMenuItem(
      child: Text('RT News'),
      value: 'https://www.rt.com/rss/news/',
    ),
    DropdownMenuItem(
      child: Text('Sky News'),
      value: 'https://feeds.skynews.com/feeds/rss/world.xml',
    ),
    DropdownMenuItem(
      child: Text('The Guardian'),
      value: 'https://www.theguardian.com/world/rss',
    ),
    DropdownMenuItem(
      child: Text('The Wall Street Journal'),
      value: 'https://feeds.a.dj.com/rss/RSSWorldNews.xml',
    ),
    DropdownMenuItem(
      child: Text('Washington Post'),
      value: 'http://feeds.washingtonpost.com/rss/world',
    ),
  ];
  List<DropdownMenuItem<String>> arabicNotificationSources = const [
    DropdownMenuItem(
      child: Text('CNN | العربية'),
      value: 'https://arabic.cnn.com/api/v1/rss/world/rss.xml',
    ),
    DropdownMenuItem(
      child: Text('DW | العربية'),
      value: 'https://rss.dw.com/rdf/rss-ar-news',
    ),
    DropdownMenuItem(
      child: Text('France 24 | عربية'),
      value: 'https://www.france24.com/ar/rss',
    ),
    DropdownMenuItem(
      child: Text('RT العربية'),
      value: 'https://arabic.rt.com/rss/',
    ),
    DropdownMenuItem(
      child: Text('العربية | العالم'),
      value: 'https://www.alarabiya.net/.mrss/ar/arab-and-world.xml',
    ),
    DropdownMenuItem(
      child: Text('الجزيرة العربية'),
      value:
          'https://www.aljazeera.net/aljazeerarss/a7c186be-1baa-4bd4-9d80-a84db769f779/73d0e1b4-532f-45ef-b135-bfdff8b8cab9',
    ),
  ];
}
