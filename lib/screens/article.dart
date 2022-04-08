import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../providers/news_requests.dart';
import '../widgets/articles/article_card.dart';
import '../widgets/articles/articles_background.dart';
import '../widgets/articles/cover_image.dart';

class Articles extends StatefulWidget {
  String path;
  String name;
  String image;
  Articles({required this.path, required this.name, required this.image});

  @override
  State<Articles> createState() => _ArticlesState();
}

class _ArticlesState extends State<Articles> {
  Future<void> _openArticle(String url) async {
    //to open the article on it's own url
    if (await canLaunch(url)) {
      await launch(
        url,
        forceWebView: true,
        enableJavaScript: true,
        enableDomStorage: true,
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final newsServices = Provider.of<NewsServices>(context, listen: false);

    return Scaffold(
      body: Stack(
        children: [
          const ArticlesBackground(),
          FutureBuilder(
            future: newsServices.getNewsFeed(widget.path),
            builder: (context, snapshot) =>
                (snapshot.connectionState == ConnectionState.waiting)
                    ? const Center(child: CircularProgressIndicator())
                    : CustomScrollView(
                        slivers: [
                          CoverImage(image: widget.image),
                          SliverList(
                            delegate: SliverChildBuilderDelegate(
                              (context, index) => GestureDetector(
                                onTap: () {
                                  _openArticle(newsServices.news[index].link!);
                                },
                                child: ArticleCard(
                                    title: newsServices.news[index].title,
                                    pubDate: newsServices.news[index].pubDate),
                              ),
                              childCount: newsServices.news.length,
                            ),
                          ),
                        ],
                      ),
          ),
        ],
      ),
    );
  }
}
