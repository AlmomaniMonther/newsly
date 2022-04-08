import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:restart_app/restart_app.dart';

import '../helpers/notifications_sources_list.dart';

class SettingsScreen extends StatefulWidget {
  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String? language;
  String? _langInitValue;
  String? _notifications;
  String? notifInitValue;
  String? _firstLanguageChosen;
  String? _firstNotifSourceChosen;
  late var prefs;

  void getLanguage() async {
    //get the language of the application
    prefs = await SharedPreferences.getInstance();

    setState(() {
      language = prefs.getString('language');
      _langInitValue = language!;
      _firstLanguageChosen = language!;
    });
  }

  void cancelChanges() async {
    //cancel all changes that have been made
    prefs = await SharedPreferences.getInstance();
    prefs.setString('language', _firstLanguageChosen);
    prefs.setString('notifications', _firstNotifSourceChosen);
    _langInitValue = _firstLanguageChosen;
    notifInitValue = _firstNotifSourceChosen;
    Navigator.of(context).pop();
  }

  void getNotificationsSource() async {
    //get the notification source of the application
    prefs = await SharedPreferences.getInstance();

    setState(() {
      _notifications = prefs.getString('notifications');
      notifInitValue = _notifications!;
      _firstNotifSourceChosen = _notifications!;
    });
  }

  void changeNotificationsSource(String _newNotifSource) async {
    //change Notifications Source
    prefs = await SharedPreferences.getInstance();

    setState(() {
      prefs.setString('notifications', _newNotifSource);
    });
  }

  void changeLanguage(String _newLanguage) async {
    //change the language of the application
    prefs = await SharedPreferences.getInstance();

    setState(() {
      prefs.setString('language', _newLanguage);
    });
  }

  @override
  void didChangeDependencies() {
    getLanguage();
    getNotificationsSource();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final _mediaQuery = MediaQuery.of(context);
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient:
              LinearGradient(colors: [Colors.white, Colors.grey.shade400])),
      height: _mediaQuery.orientation == Orientation.portrait
          ? _mediaQuery.size.height / 2.8
          : _mediaQuery.size.width / 2.8,
      padding: const EdgeInsets.all(12),
      width: _mediaQuery.size.width * 3.5 / 4,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          const Positioned(
            top: -30,
            right: -30,
            child: CircleAvatar(
              radius: 30,
              child: Icon(
                Icons.settings,
                size: 50,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Flexible(
                  fit: FlexFit.tight, child: SettingsTitle(language: language)),
              language == null || language == 'english'
                  ? Flexible(
                      fit: FlexFit.tight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Choose your language: ',
                          ),
                          DropdownButton(
                            value: _langInitValue,
                            items: const [
                              DropdownMenuItem(
                                child: Text('English'),
                                value: 'english',
                              ),
                              DropdownMenuItem(
                                child: Text('Arabic'),
                                value: 'arabic',
                              ),
                            ],
                            onChanged: (value) {
                              changeLanguage(value.toString());
                              setState(() {
                                _langInitValue = value.toString();
                              });
                            },
                          ),
                        ],
                      ),
                    )
                  : Flexible(
                      fit: FlexFit.tight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          DropdownButton(
                            value: _langInitValue,
                            items: const [
                              DropdownMenuItem(
                                child: Text('English'),
                                value: 'english',
                              ),
                              DropdownMenuItem(
                                child: Text('Arabic'),
                                value: 'arabic',
                              ),
                            ],
                            onChanged: (value) {
                              changeLanguage(value.toString());
                              setState(() {
                                _langInitValue = value.toString();
                              });
                            },
                          ),
                          const Text(
                            ':الرجاء اختيار اللغة ',
                          ),
                        ],
                      ),
                    ),
              Flexible(
                fit: FlexFit.tight,
                child: Text(
                  language == null || language == 'english'
                      ? 'Set notifications source: '
                      : 'حدد مصدر الاشعارات ',
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                child: DropdownButton(
                  alignment: Alignment.center,
                  value: notifInitValue,
                  menuMaxHeight: 400,
                  items: NotificationsSourcesList().englishNotificationSources +
                      NotificationsSourcesList().arabicNotificationSources,
                  onChanged: (value) {
                    changeNotificationsSource(value.toString());
                    setState(
                      () {
                        notifInitValue = value.toString();
                      },
                    );
                  },
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton.icon(
                        onPressed: () {
                          Restart.restartApp();
                        },
                        icon: const Icon(Icons.restart_alt_rounded),
                        label: language == null || language == 'english'
                            ? const Text('Save & Restart')
                            : const Text('حفظ')),
                    TextButton(
                        onPressed: () {
                          cancelChanges();
                        },
                        child: language == null || language == 'english'
                            ? const Text('Cancel')
                            : const Text('الغاء'))
                  ],
                ),
              ),
              const Divider(
                thickness: 2,
              ),
              Flexible(
                  fit: FlexFit.tight,
                  child: AboutAndFeedback(language: language))
            ],
          ),
        ],
      ),
    );
  }
}

class SettingsTitle extends StatelessWidget {
  const SettingsTitle({
    Key? key,
    required this.language,
  }) : super(key: key);

  final String? language;

  @override
  Widget build(BuildContext context) {
    return Text(
      language == null || language == 'english' ? 'Settings' : 'الاعدادات',
      textDirection: language == null || language == 'english'
          ? TextDirection.ltr
          : TextDirection.rtl,
      textAlign: TextAlign.start,
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
    );
  }
}

class AboutAndFeedback extends StatelessWidget {
  const AboutAndFeedback({
    Key? key,
    required this.language,
  }) : super(key: key);

  final String? language;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton.icon(
            onPressed: () {
              Navigator.of(context)
                  .pushNamed('/aboutUsScreen', arguments: language);
            },
            icon: const Icon(
              Icons.info,
            ),
            label: Text(
              language == null || language == 'english'
                  ? 'About us...'
                  : 'عن المطور',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            )),
        TextButton.icon(
          onPressed: () {
            Navigator.of(context)
                .pushNamed('/feedbackScreen', arguments: language);
          },
          icon: const Icon(
            Icons.feedback,
          ),
          label: Text(
            language == null || language == 'english'
                ? 'Feedback...'
                : 'تجربتك',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
        ),
      ],
    );
  }
}
