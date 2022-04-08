import 'package:flutter/material.dart';

import '../../helpers/categories_source.dart';

typedef StringCallback = void Function(String categoryName);

class Categories extends StatelessWidget {
  final StringCallback onCategoryChanged;
  Categories(
      {Key? key, required this.onCategoryChanged, required this.appLanguage})
      : super(key: key);
  String categoryName = '';
  String? appLanguage;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: ListView.builder(
        itemCount: CategoriesSource().categories.length,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            categoryName =
                CategoriesSource().categories[index]['categoryName']!;
            onCategoryChanged(categoryName);
          },
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                      image: AssetImage(
                        CategoriesSource().categories[index]['categoryImage']!,
                      ),
                      fit: BoxFit.cover),
                ),
                margin: const EdgeInsets.only(right: 8),
                width: 120,
                height: 60,
              ),
              Container(
                alignment: Alignment.center,
                height: 60,
                width: 120,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.black26),
                child: Text(
                  appLanguage == null || appLanguage == 'english'
                      ? CategoriesSource().categories[index]['categoryName']!
                      : CategoriesSource().categories[index]
                          ['categoryNameArabic']!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
