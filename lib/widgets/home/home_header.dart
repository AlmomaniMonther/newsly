import 'package:flutter/material.dart';

import '../../screens/settings_screen.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () {
                showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) => AlertDialog(
                          contentPadding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          content: SettingsScreen(),
                        ));
              },
              icon: const Icon(
                Icons.settings,
                color: Colors.white,
                size: 30,
              )),
          const Text(
            'Newsly',
            style: TextStyle(
                color: Colors.white,
                fontSize: 35,
                fontWeight: FontWeight.w600,
                fontFamily: 'MeaCulpa'),
          ),
          const SizedBox(width: 30, height: 30)
        ],
      ),
      height: kToolbarHeight,
    );
  }
}
