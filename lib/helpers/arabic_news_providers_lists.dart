class ArabicNewsProvidersLists {
  final List<Map<String, String>> _businessNewsProviders = [
    {
      'name': 'العربية | اقتصاد',
      'image': 'assets/news_providers/business/alarabia.jpg',
      'path': 'https://www.alarabiya.net/.mrss/ar/aswaq.xml',
    },
    {
      'name': 'CNN افتصاد ',
      'image': 'assets/news_providers/arab_world/cnn_arabic.jpg',
      'path': 'https://arabic.cnn.com/api/v1/rss/business/rss.xml',
    },
    {
      'name': 'France 24 | اقتصاد',
      'image': 'assets/news_providers/world/france24.jpg',
      'path':
          'https://www.france24.com/ar/%D8%A7%D9%82%D8%AA%D8%B5%D8%A7%D8%AF/rss',
    },
    {
      'name': 'DW | اقتصاد',
      'image': 'assets/news_providers/world/dw.jpg',
      'path': 'http://rss.dw.de/rdf/rss-ar-bus',
    },
    {
      'name': 'صحيفة الشرق الأوسط | اقتصاد',
      'image': 'assets/news_providers/arab_world/awsat.png',
      'path': 'https://aawsat.com/feed/economy',
    },
  ];
  List<Map<String, String>> get businessNewsProviders {
    return [..._businessNewsProviders];
  }

  final List<Map<String, String>> _generalNewsProviders = [
    {
      'name': 'CNN | العربية',
      'image': 'assets/news_providers/arab_world/cnn_arabic.jpg',
      'path': 'https://arabic.cnn.com/api/v1/rss/world/rss.xml',
    },
    {
      'name': 'DW | العربية',
      'image': 'assets/news_providers/world/dw.jpg',
      'path': 'https://rss.dw.com/rdf/rss-ar-news',
    },
    {
      'name': 'France 24 | عربية',
      'image': 'assets/news_providers/world/france24.jpg',
      'path': 'https://www.france24.com/ar/rss',
    },
    {
      'name': 'RT العربية',
      'image': 'assets/news_providers/arab_world/rt_arabic.jpg',
      'path': 'https://arabic.rt.com/rss/',
    },
    {
      'name': 'صحيفة الشرق الأوسط',
      'image': 'assets/news_providers/world/awsat.png',
      'path': 'https://aawsat.com/feed',
    },
    {
      'name': 'العربية | العالم',
      'image': 'assets/news_providers/arab_world/alarabia.jpg',
      'path': 'https://www.alarabiya.net/.mrss/ar/arab-and-world.xml',
    },
    {
      'name': 'الجزيرة العربية',
      'image': 'assets/news_providers/arab_world/aljazeera_arabic.jpg',
      'path':
          'https://www.aljazeera.net/aljazeerarss/a7c186be-1baa-4bd4-9d80-a84db769f779/73d0e1b4-532f-45ef-b135-bfdff8b8cab9',
    },
  ];
  List<Map<String, String>> get generalNewsProviders {
    return [..._generalNewsProviders];
  }

  final List<Map<String, String>> _entertainmentNewsProviders = [
    {
      'name': 'العربية | ترفية',
      'image': 'assets/news_providers/arab_world/alarabia.jpg',
      'path': 'https://www.alarabiya.net/.mrss/ar/variety.xml',
    },
    {
      'name': 'France 24 | ثقافة',
      'image': 'assets/news_providers/world/france24.jpg',
      'path': 'https://www.france24.com/ar/%D8%AB%D9%82%D8%A7%D9%81%D8%A9/rss',
    },
    {
      'name': 'الأمم المتحدة | الثقافة والتعليم',
      'image': 'assets/news_providers/health/united_nations.jpg',
      'path':
          'https://news.un.org/feed/subscribe/ar/news/topic/culture-and-education/feed/rss.xml',
    },
    {
      'name': 'CNN | منوعات',
      'image': 'assets/news_providers/arab_world/cnn_arabic.jpg',
      'path': 'https://arabic.cnn.com/api/v1/rss/entertainment/rss.xml',
    },
  ];
  List<Map<String, String>> get entertainmentNewsProviders {
    return [..._entertainmentNewsProviders];
  }

  final List<Map<String, String>> _healthNewsProviders = [
    {
      'name': 'الأمم المتحدة | صحة',
      'image': 'assets/news_providers/health/united_nations.jpg',
      'path':
          'https://news.un.org/feed/subscribe/ar/news/topic/health/feed/rss.xml',
    },
    {
      'name': 'صحيفة الشرق الأوسط | صحة',
      'image': 'assets/news_providers/arab_world/awsat.png',
      'path': 'https://aawsat.com/feed/health',
    },
  ];
  List<Map<String, String>> get healthNewsProviders {
    return [..._healthNewsProviders];
  }

  final List<Map<String, String>> _sportsNewsProviders = [
    {
      'name': 'CNN | رياضة',
      'image': 'assets/news_providers/sports/cnn_sport.jpg',
      'path': 'https://arabic.cnn.com/api/v1/rss/sport/rss.xml',
    },
    {
      'name': 'الملاعب',
      'image': 'assets/news_providers/sports/almalaeb.jpg',
      'path': 'https://www.al-mala3b.net/rss.php?type=news&id=38',
    },
    {
      'name': 'العرب اليوم| رياضة',
      'image': 'assets/news_providers/sports/arabs-sport.png',
      'path': 'https://www.arabstoday.net/sports/rss.xml',
    },
    {
      'name': 'france24 |رياضة',
      'image': 'assets/news_providers/arab_world/france24_arabic.jpg',
      'path': 'https://www.france24.com/ar/%D8%B1%D9%8A%D8%A7%D8%B6%D8%A9/rss',
    },
    {
      'name': 'العربية | رياضة',
      'image': 'assets/news_providers/arab_world/alarabia.jpg',
      'path': 'https://www.alarabiya.net/.mrss/ar/sport.xml',
    },
  ];
  List<Map<String, String>> get sportsNewsProviders {
    return [..._sportsNewsProviders];
  }

  final List<Map<String, String>> _technologyScienceNewsProviders = [
    {
      'name': 'DW | تكنولوجيا',
      'image': 'assets/news_providers/arab_world/dw_arabic.jpg',
      'path': 'http://rss.dw.de/rdf/rss-ar-sci',
    },
    {
      'name': 'العربية | تكنولوجيا',
      'image': 'assets/news_providers/arab_world/alarabia.jpg',
      'path': 'https://www.alarabiya.net/.mrss/ar/technology.xml',
    },
    {
      'name': 'CNN | علوم وتكنولوجيا',
      'image': 'assets/news_providers/arab_world/cnn_arabic.jpg',
      'path': 'https://arabic.cnn.com/api/v1/rss/business/rss.xml',
    },
    {
      'name': 'صحيفة الشرق الأوسط | تكنولوجيا',
      'image': 'assets/news_providers/arab_world/awsat.png',
      'path': 'https://aawsat.com/feed/information-technology',
    },
  ];
  List<Map<String, String>> get technologyScienceNewsProviders {
    return [..._technologyScienceNewsProviders];
  }

  final List<Map<String, String>> _arabWorldNewsProviders = [
    {
      'name': 'الجزيرة العربية',
      'image': 'assets/news_providers/arab_world/aljazeera_arabic.jpg',
      'path':
          'https://www.aljazeera.net/aljazeerarss/a7c186be-1baa-4bd4-9d80-a84db769f779/73d0e1b4-532f-45ef-b135-bfdff8b8cab9',
    },
    {
      'name': 'وكالة عمون الإخبارية',
      'image': 'assets/news_providers/arab_world/ammon.jpg',
      'path': 'https://www.ammonnews.net/rss.php?type=news&id=12',
    },
    {
      'name': 'العربية',
      'image': 'assets/news_providers/arab_world/alarabia.jpg',
      'path': 'https://www.alarabiya.net/.mrss/ar.xml',
    },
    {
      'name': 'CNN | العربية',
      'image': 'assets/news_providers/arab_world/cnn_arabic.jpg',
      'path': 'https://arabic.cnn.com/api/v1/rss/middle_east/rss.xml',
    },
    {
      'name': 'DW | العربية',
      'image': 'assets/news_providers/arab_world/dw_arabic.jpg',
      'path': 'http://rss.dw.de/rdf/rss-ar-news',
    },
    {
      'name': 'France24 | العربية',
      'image': 'assets/news_providers/arab_world/france24_arabic.jpg',
      'path':
          'https://www.france24.com/ar/%D8%A7%D9%84%D8%B4%D8%B1%D9%82-%D8%A7%D9%84%D8%A3%D9%88%D8%B3%D8%B7/rss',
    },
    {
      'name': 'RT | العربية',
      'image': 'assets/news_providers/arab_world/rt_arabic.jpg',
      'path': 'https://arabic.rt.com/rss/',
    },
    {
      'name': 'صحيفة الشرق الأوسط',
      'image': 'assets/news_providers/arab_world/awsat.png',
      'path': 'https://aawsat.com/feed/arab-world',
    },
  ];
  List<Map<String, String>> get arabWorldNewsProviders {
    return [..._arabWorldNewsProviders];
  }
}
