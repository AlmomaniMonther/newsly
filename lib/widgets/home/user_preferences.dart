import 'package:flutter/material.dart';
import 'package:restart_app/restart_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../helpers/notifications_sources_list.dart';

class UserPreferences extends StatefulWidget {
  const UserPreferences({Key? key}) : super(key: key);

  @override
  State<UserPreferences> createState() => _UserPreferencesState();
}

class _UserPreferencesState extends State<UserPreferences> {
  String? _langInitValue;
  String? _notifInitValue;

  void setLanguage(String _newLanguage) async {
    //set the app language that the user wants
    final prefs = await SharedPreferences.getInstance();

    prefs.setString('language', _newLanguage);
  }

  void setNotificationsSource(String _notificationSource) async {
    //set the notification source that the user wants
    final prefs = await SharedPreferences.getInstance();

    prefs.setString('notifications', _notificationSource);
  }

  void save() async {
    //restart the app to make changes to the user interface as the user wants
    Restart.restartApp();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient:
                LinearGradient(colors: [Colors.white, Colors.grey.shade400])),
        height: mediaQuery.height / 3.5,
        padding: const EdgeInsets.all(18),
        width: mediaQuery.width * 3.5 / 4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Flexible(
              flex: 1,
              fit: FlexFit.loose,
              child: Text(
                'Please select your preferences:',
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Choose your language:  ',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
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
                      setLanguage(value.toString());
                      setState(() {
                        _langInitValue = value.toString();
                      });
                    },
                  ),
                ],
              ),
            ),
            if (_langInitValue != null)
              const Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Text(
                  'Choose your notifications source: ',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            if (_langInitValue != null)
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: DropdownButton(
                  value: _notifInitValue,
                  items: NotificationsSourcesList().englishNotificationSources +
                      NotificationsSourcesList().arabicNotificationSources,
                  onChanged: (value) {
                    setNotificationsSource(value.toString());
                    setState(() {
                      _notifInitValue = value.toString();
                    });
                  },
                ),
              ),
            if (_notifInitValue != null && _langInitValue != null)
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: ElevatedButton(
                    onPressed: () {
                      save();
                    },
                    child: const Text('Save')),
              ),
          ],
        ));
  }
}
