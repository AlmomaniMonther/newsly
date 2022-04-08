import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ArticleCard extends StatelessWidget {
  const ArticleCard({Key? key, required this.title, required this.pubDate})
      : super(key: key);

  final String? title;
  final DateTime? pubDate;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 224, 224, 224),
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        height: 100,
        padding: const EdgeInsets.all(8),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            if (title != null)
              Positioned(
                right: 10,
                left: 10,
                child: Text(
                  title!,
                  maxLines: 3,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),

            if (pubDate != null)
              Positioned(
                bottom: 7,
                right: 10,
                child: Text(
                  'Published at: ' +
                      DateFormat.yMMMd().add_Hm().format(pubDate!),
                  style: const TextStyle(
                      color: Color.fromARGB(255, 100, 100, 100)),
                ),
              ),

            // Text(newsServices.news[index].categories!.single.value)
          ],
        ),
      ),
    );
  }
}
