import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);
  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final _mediaQuery = MediaQuery.of(context);
    final language = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, kToolbarHeight),
        child: ClipRRect(
          borderRadius:
              const BorderRadius.vertical(bottom: Radius.circular(20)),
          child: AppBar(
            title: Text(
              language == null || language == 'english'
                  ? 'About Me...'
                  : 'عن المطور',
              textDirection: language == null || language == 'english'
                  ? TextDirection.ltr
                  : TextDirection.rtl,
            ),
            centerTitle: true,
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: language == null || language == 'english'
              ? CrossAxisAlignment.start
              : CrossAxisAlignment.end,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: _mediaQuery.orientation == Orientation.portrait
                      ? _mediaQuery.size.height / 3
                      : _mediaQuery.size.height / 2,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black54,
                        Colors.grey,
                        Colors.white10,
                      ],
                    ),
                  ),
                ),
                Positioned(
                    bottom: MediaQuery.of(context).orientation ==
                            Orientation.portrait
                        ? -50
                        : -100,
                    right: 0,
                    left: 0,
                    child: CircleAvatar(
                      child: Image.asset(
                        'assets/developer.png',
                        fit: BoxFit.cover,
                      ),
                      radius: 100,
                    )),
              ],
            ),
            const SizedBox(
              height: 70,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                language == null || language == 'english'
                    ? 'About me:'
                    : 'عن المطور:',
                textDirection: language == null || language == 'english'
                    ? TextDirection.ltr
                    : TextDirection.rtl,
                textAlign: TextAlign.left,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(14),
              child: Text(
                language == null || language == 'english'
                    ? 'Hello everybody! \nMy name is Monther Almomani,'
                        ' a communication engineer student in the last year.'
                        ' \nI started to learn mobile app development about six months'
                        ' ago, and this is my first application totally developed by me.'
                        ' \nHope you enjoy your time using it and send me feedback about'
                        ' your experience and what you hope to be better in the future.'
                        '\nThank you for your support.'
                    : 'السلام عليكم ورحمة الله وبركاته \nاسمي منذر المومني,'
                        ' مهندس اتصالات في السنة الأخيره.'
                        ' \nبدأت تعلم البرمجة منذ ما يقارب الستة أشهر'
                        ' وهذا التطبيق من أوائل التطبيقات التي قمت بتطويرها.'
                        ' \nاتمنى أن تستمتعوا باستخدامه وتزويدي بتجربتكم'
                        ' وملاحظاتكم عن التطبيق لأتمكن من تقديم المزيد مستقبلاً.'
                        '\nشكراً لكم على دعمكم المتواصل.',
                textDirection: language == null || language == 'english'
                    ? TextDirection.ltr
                    : TextDirection.rtl,
                style: language == null || language == 'english'
                    ? const TextStyle(
                        fontSize: 17,
                        overflow: TextOverflow.visible,
                        fontStyle: FontStyle.italic)
                    : const TextStyle(
                        fontSize: 17,
                        overflow: TextOverflow.visible,
                      ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                language == null || language == 'english'
                    ? 'Contact me:'
                    : 'للتواصل معي:',
                textDirection: language == null || language == 'english'
                    ? TextDirection.ltr
                    : TextDirection.rtl,
                textAlign: TextAlign.left,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    primary: Colors.white70,
                  ),
                  onPressed: () {
                    _launchURL('https://facebook.com/monther.almomani/');
                  },
                  child: Image.asset(
                    'assets/logos/facebook_logo.png',
                    width: 75,
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      primary: Colors.white70),
                  onPressed: () {
                    _launchURL('https://twitter.com/eng_abo_habib');
                  },
                  child: Image.asset(
                    'assets/logos/twitter_logo.png',
                    width: 75,
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      primary: Colors.white70),
                  onPressed: () {
                    _launchURL('https://instagram.com/eng.abo.habib');
                  },
                  child: Image.asset(
                    'assets/logos/instagram_logo.png',
                    width: 75,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: language == null || language == 'english'
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Support me on PayPal:',
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              primary: Colors.white70),
                          onPressed: () {
                            _launchURL('https://paypal.me/abohabib98');
                          },
                          child: Image.asset(
                            'assets/logos/paypal_logo.png',
                            width: 75,
                          ),
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              primary: Colors.white70),
                          onPressed: () {
                            _launchURL('https://paypal.me/abohabib98');
                          },
                          child: Image.asset(
                            'assets/logos/paypal_logo.png',
                            width: 75,
                          ),
                        ),
                        const Text(
                          'لتقديم الدعم عن طريق PayPal:  ',
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
