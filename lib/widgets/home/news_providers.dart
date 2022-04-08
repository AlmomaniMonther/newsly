import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';

import '../../helpers/arabic_news_providers_lists.dart';
import '../../helpers/english_news_providers_lists.dart';
import '../../providers/news_requests.dart';
import '../../screens/article.dart';

class NewsProviders extends StatelessWidget {
  String category;
  String? language;
  NewsProviders({required this.category, required this.language});

  List<Map<String, String>> newsProviders = [];

  void categoryChanger() {
    //to change the NEWS Providers as category changes
    if (language == 'english' || language == null) {
      if (category == 'Business') {
        newsProviders = NewsProvidersLists().businessNewsProviders;
      } else if (category == 'Entertainment') {
        newsProviders = NewsProvidersLists().entertainmentNewsProviders;
      } else if (category == 'World') {
        newsProviders = NewsProvidersLists().generalNewsProviders;
      } else if (category == 'Health') {
        newsProviders = NewsProvidersLists().healthNewsProviders;
      } else if (category == 'Sports') {
        newsProviders = NewsProvidersLists().sportsNewsProviders;
      } else if (category == 'Science & Technology') {
        newsProviders = NewsProvidersLists().technologyScienceNewsProviders;
      } else if (category == 'Arab World') {
        newsProviders = NewsProvidersLists().arabWorldNewsProviders;
      } else {
        newsProviders = NewsProvidersLists().generalNewsProviders;
      }
    } else {
      if (category == 'Business') {
        newsProviders = ArabicNewsProvidersLists().businessNewsProviders;
      } else if (category == 'Entertainment') {
        newsProviders = ArabicNewsProvidersLists().entertainmentNewsProviders;
      } else if (category == 'World') {
        newsProviders = ArabicNewsProvidersLists().generalNewsProviders;
      } else if (category == 'Health') {
        newsProviders = ArabicNewsProvidersLists().healthNewsProviders;
      } else if (category == 'Sports') {
        newsProviders = ArabicNewsProvidersLists().sportsNewsProviders;
      } else if (category == 'Science & Technology') {
        newsProviders =
            ArabicNewsProvidersLists().technologyScienceNewsProviders;
      } else if (category == 'Arab World') {
        newsProviders = ArabicNewsProvidersLists().arabWorldNewsProviders;
      } else {
        newsProviders = ArabicNewsProvidersLists().generalNewsProviders;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    categoryChanger();
    Provider.of<NewsServices>(context, listen: false);

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height - kToolbarHeight - 100,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: AnimationLimiter(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: ListView.builder(
                  itemCount: newsProviders.length,
                  scrollDirection: Axis.vertical,
                  padding: const EdgeInsets.all(8),
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Articles(
                                path: newsProviders[index]['path']!,
                                name: newsProviders[index]['name']!,
                                image: newsProviders[index]['image']!,
                              )));
                    },
                    child: Stack(
                      children: [
                        ImageContainer(
                          image: newsProviders[index]['image']!,
                        ),
                        TitleContainer(
                          title: newsProviders[index]['name']!,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 100,
          )
        ],
      ),
    );
  }
}

class TitleContainer extends StatelessWidget {
  const TitleContainer({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomRight,
      padding: const EdgeInsets.all(16),
      height: 240,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), color: Colors.black26),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 20,
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class ImageContainer extends StatelessWidget {
  const ImageContainer({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
      ),
      margin: const EdgeInsets.only(bottom: 8),
      width: double.infinity,
      height: 240,
    );
  }
}
