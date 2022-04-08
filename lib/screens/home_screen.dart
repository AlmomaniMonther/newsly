// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:newsly/widgets/home/news_providers.dart';
import 'package:newsly/widgets/home/sub_categories.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/home/categories.dart';
import '../widgets/home/home_background.dart';
import '../widgets/home/home_header.dart';
import '../widgets/home/user_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _categoryName = 'General';
  String? language;
  ////////////////////////////////////////////////////////////////////////////////////////////
  //this method is to change the category
  // on the screen as the user clicks on another one
  //by default the category is 'General'
  void updateNewsProviders(String categoryName) {
    setState(() {
      _categoryName = categoryName;
    });
  }

  ////////////////////////////////////////////////////////////////////////////////////////////
  //select the language and the source for the notifications that user wants
  //only at the first time that the app is started
  //it can be changed later from the settings
  void _selectUserPreferences() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
              contentPadding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              content: UserPreferences(),
            ));
  }

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((prefs) {
      final int dialogOpen = prefs.getInt('dialog_open') ?? 0;
      if (dialogOpen == 0) {
        //show dialog for one time only
        Future.delayed(const Duration(milliseconds: 1000), () {
          _selectUserPreferences();
          prefs.setInt("dialog_open", 1);
        });
      }
    });
  }

  ////////////////////////////////////////////////////////////////////////////////////////////
// get the language that the user is currently using
  late var prefs;
  void getLanguage() async {
    prefs = await SharedPreferences.getInstance();

    setState(() {
      language = prefs.getString('language');
    });
  }

  @override
  void didChangeDependencies() {
    getLanguage();
    super.didChangeDependencies();
  }
  ////////////////////////////////////////////////////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            const HomeBackground(),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 30,
                ),
                const HomeHeader(),
                Categories(
                  onCategoryChanged: updateNewsProviders,
                  appLanguage: language,
                ),
                SubCategories(
                  appLanguage: language,
                ),
                const SizedBox(
                  height: 8,
                ),
                NewsProviders(
                  category: _categoryName,
                  language: language,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
