class NewsProvidersLists {
  final List<Map<String, String>> _businessNewsProviders = [
    {
      'name': 'Financial Times',
      'image': 'assets/news_providers/business/financial_times.jpg',
      'path': 'https://www.ft.com/global-economy?format=rss',
    },
    {
      'name': 'BBC-News | Business',
      'image': 'assets/news_providers/business/bbc_news_business.jpg',
      'path': 'http://feeds.bbci.co.uk/news/business/rss.xml',
    },
    {
      'name': 'CNN | Money',
      'image': 'assets/news_providers/business/cnn_money.png',
      'path': 'http://rss.cnn.com/rss/money_news_international.rss',
    },
    {
      'name': 'DW | Business',
      'image': 'assets/news_providers/world/dw.jpg',
      'path': 'https://rss.dw.com/rdf/rss-en-bus',
    },
    {
      'name': 'France24 | Business',
      'image': 'assets/news_providers/world/france24.jpg',
      'path': 'https://www.france24.com/en/business-tech/rss',
    },
    {
      'name': 'New York Times | Economy',
      'image': 'assets/news_providers/world/new_york_times.jpg',
      'path': 'https://rss.nytimes.com/services/xml/rss/nyt/Economy.xml',
    },
    {
      'name': 'Sky News | Business',
      'image': 'assets/news_providers/world/sky_news.png',
      'path': 'https://feeds.skynews.com/feeds/rss/business.xml',
    },
  ];
  List<Map<String, String>> get businessNewsProviders {
    return [..._businessNewsProviders];
  }

  final List<Map<String, String>> _generalNewsProviders = [
    {
      'name': 'BBC-News',
      'image': 'assets/news_providers/world/bbc_news.jpg',
      'path': 'http://feeds.bbci.co.uk/news/world/rss.xml',
    },
    {
      'name': 'CNN',
      'image': 'assets/news_providers/world/cnn.jpg',
      'path': 'http://rss.cnn.com/rss/edition_world.rss',
    },
    {
      'name': 'Deutsche Welle',
      'image': 'assets/news_providers/world/dw.jpg',
      'path': 'https://rss.dw.com/rdf/rss-en-world',
    },
    {
      'name': 'France 24',
      'image': 'assets/news_providers/world/france24.jpg',
      'path': 'https://www.france24.com/en/rss',
    },
    {
      'name': 'New York Times',
      'image': 'assets/news_providers/world/new_york_times.jpg',
      'path': 'https://rss.nytimes.com/services/xml/rss/nyt/World.xml',
    },
    {
      'name': 'RT News',
      'image': 'assets/news_providers/world/rt.jpg',
      'path': 'https://www.rt.com/rss/news/',
    },
    {
      'name': 'Sky News',
      'image': 'assets/news_providers/world/sky_news.png',
      'path': 'https://feeds.skynews.com/feeds/rss/world.xml',
    },
    {
      'name': 'The Guardian',
      'image': 'assets/news_providers/world/the_guardian.jpg',
      'path': 'https://www.theguardian.com/world/rss',
    },
    {
      'name': 'The Wall Street Journal',
      'image': 'assets/news_providers/world/the_wall_street_journal.jpg',
      'path': 'https://feeds.a.dj.com/rss/RSSWorldNews.xml',
    },
    {
      'name': 'Washington Post',
      'image': 'assets/news_providers/world/the_washington_post.jpg',
      'path': 'http://feeds.washingtonpost.com/rss/world',
    },
  ];
  List<Map<String, String>> get generalNewsProviders {
    return [..._generalNewsProviders];
  }

  final List<Map<String, String>> _entertainmentNewsProviders = [
    {
      'name': 'BBC-News | Entertainment',
      'image': 'assets/news_providers/entertainment/bbc_entertainment.jpg',
      'path': 'http://feeds.bbci.co.uk/news/entertainment_and_arts/rss.xml',
    },
    {
      'name': 'CNN | Entertainment',
      'image': 'assets/news_providers/world/cnn.jpg',
      'path': 'http://rss.cnn.com/rss/edition_entertainment.rss',
    },
    {
      'name': 'DW | Culture & Lifestyle',
      'image': 'assets/news_providers/world/dw.jpg',
      'path': 'https://rss.dw.com/rdf/rss-en-cul',
    },
    {
      'name': 'New York Times | Arts',
      'image': 'assets/news_providers/world/new_york_times.jpg',
      'path': 'https://rss.nytimes.com/services/xml/rss/nyt/Arts.xml',
    },
    {
      'name': 'ELLE Fashion',
      'image': 'assets/news_providers/entertainment/elle_fashion.jpg',
      'path': 'https://www.elle.com/rss/all.xml/',
    },
  ];
  List<Map<String, String>> get entertainmentNewsProviders {
    return [..._entertainmentNewsProviders];
  }

  final List<Map<String, String>> _healthNewsProviders = [
    {
      'name': 'Covid-19',
      'image': 'assets/news_providers/health/covid_19.jpg',
      'path': 'https://www.theguardian.com/world/coronavirus-outbreak/rss',
    },
    {
      'name': 'World Health Organization',
      'image': 'assets/news_providers/health/who.jpeg',
      'path': 'https://www.who.int/feeds/entity/mediacentre/news/en/rss.xml',
    },
    {
      'name': 'New York Times | Health',
      'image': 'assets/news_providers/world/new_york_times.jpg',
      'path': 'https://rss.nytimes.com/services/xml/rss/nyt/Health.xml',
    },
  ];
  List<Map<String, String>> get healthNewsProviders {
    return [..._healthNewsProviders];
  }

  final List<Map<String, String>> _sportsNewsProviders = [
    {
      'name': 'BBC Sports',
      'image': 'assets/news_providers/sports/bbc_sport.jpg',
      'path': 'http://feeds.bbci.co.uk/sport/rss.xml?edition=uk',
    },
    {
      'name': 'ESPN Sports',
      'image': 'assets/news_providers/sports/espn.jpg',
      'path': 'https://www.espn.com/espn/rss/news',
    },
    {
      'name': 'Fox Sports',
      'image': 'assets/news_providers/sports/fox_sports.png',
      'path': 'https://www.foxsports.com.au/content-feeds/breaking-news/',
    },
    {
      'name': 'CNN | Sport',
      'image': 'assets/news_providers/sports/cnn_sport.jpg',
      'path': 'http://rss.cnn.com/rss/edition_sport.rss',
    },
    {
      'name': 'DW | Sport',
      'image': 'assets/news_providers/world/dw.jpg',
      'path': 'https://rss.dw.com/rdf/rss-en-sports',
    },
    {
      'name': 'France24 | Sport',
      'image': 'assets/news_providers/world/france24.jpg',
      'path': 'https://www.france24.com/en/sport/rss',
    },
  ];
  List<Map<String, String>> get sportsNewsProviders {
    return [..._sportsNewsProviders];
  }

  final List<Map<String, String>> _technologyScienceNewsProviders = [
    {
      'name': 'MIT Technology Review',
      'image': 'assets/news_providers/technology/mit_tech.png',
      'path': 'https://www.technologyreview.com/feed/',
    },
    {
      'name': 'New York Times Science',
      'image': 'assets/news_providers/science/new_york_times.jpg',
      'path':
          'https://www.nytimes.com/svc/collections/v1/publish/http://www.nytimes.com/section/science/rss.xml',
    },
    {
      'name': 'Forbes Science',
      'image': 'assets/news_providers/science/forbes_science.jpg',
      'path': 'https://www.forbes.com/science/feed2/',
    },
    {
      'name': 'Huffpost',
      'image': 'assets/news_providers/science/huffpost.jpg',
      'path': 'https://www.huffpost.com/section/science/feed',
    },
    {
      'name': 'BBC-News | Science',
      'image': 'assets/news_providers/world/bbc_news.jpg',
      'path': 'http://feeds.bbci.co.uk/news/science_and_environment/rss.xml',
    },
    {
      'name': 'DW | Science',
      'image': 'assets/news_providers/world/dw.jpg',
      'path': 'https://rss.dw.com/xml/rss_en_science',
    },
  ];
  List<Map<String, String>> get technologyScienceNewsProviders {
    return [..._technologyScienceNewsProviders];
  }

  final List<Map<String, String>> _arabWorldNewsProviders = [
    {
      'name': 'CNN | Middle East',
      'image': 'assets/news_providers/world/cnn.jpg',
      'path': 'http://rss.cnn.com/rss/edition_meast.rss',
    },
    {
      'name': 'New York Times | Middle East',
      'image': 'assets/news_providers/world/new_york_times.jpg',
      'path': 'https://rss.nytimes.com/services/xml/rss/nyt/MiddleEast.xml',
    },
    {
      'name': 'France24 | Middle East',
      'image': 'assets/news_providers/arab_world/france24_arabic.jpg',
      'path': 'https://www.france24.com/en/middle-east/rss',
    },
    {
      'name': 'The Guardian | Middle East',
      'image': 'assets/news_providers/world/the_guardian.jpg',
      'path': 'https://www.theguardian.com/world/middleeast/rss',
    },
    {
      'name': 'Aljazeera',
      'image': 'assets/news_providers/arab_world/aljazeera_arabic.jpg',
      'path': 'https://www.aljazeera.com/xml/rss/all.xml',
    },
  ];
  List<Map<String, String>> get arabWorldNewsProviders {
    return [..._arabWorldNewsProviders];
  }
}
