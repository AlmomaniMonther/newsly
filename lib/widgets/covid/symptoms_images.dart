import 'package:flutter/material.dart';

class SymptomsImages extends StatelessWidget {
  SymptomsImages({
    Key? key,
    required this.appLanguage,
  }) : super(key: key);
  final List<Map<String, String>> _symptomsImagesAssets = [
    {
      'pathPic': 'assets/covid_symptoms/body_aches.png',
      'symptom': 'Muscle or body aches',
      'symptomArabic': 'الام العضلات',
    },
    {
      'pathPic': 'assets/covid_symptoms/chills.png',
      'symptom': 'Chills',
      'symptomArabic': 'قشعريرة',
    },
    {
      'pathPic': 'assets/covid_symptoms/cough.png',
      'symptom': 'Cough',
      'symptomArabic': 'سعال',
    },
    {
      'pathPic': 'assets/covid_symptoms/diarrhea.png',
      'symptom': 'Diarrhea',
      'symptomArabic': 'إسهال',
    },
    {
      'pathPic': 'assets/covid_symptoms/fatigue.png',
      'symptom': 'Fatigue',
      'symptomArabic': 'إعياء',
    },
    {
      'pathPic': 'assets/covid_symptoms/fever.png',
      'symptom': 'Fever',
      'symptomArabic': 'حمة',
    },
    {
      'pathPic': 'assets/covid_symptoms/headache.png',
      'symptom': 'Headache',
      'symptomArabic': 'صداع الراس',
    },
    {
      'pathPic': 'assets/covid_symptoms/loss_taste_smell.png',
      'symptom': 'New Loss of taste or smell',
      'symptomArabic': 'فقدان في حاسة التذوق أو الشم',
    },
    {
      'pathPic': 'assets/covid_symptoms/nausea.png',
      'symptom': 'Nausea or vomiting',
      'symptomArabic': 'الغثيان أو القيء',
    },
    {
      'pathPic': 'assets/covid_symptoms/runny_nose.png',
      'symptom': 'Congestion or Runny nose',
      'symptomArabic': 'احتقان أو سيلان الأنف',
    },
    {
      'pathPic': 'assets/covid_symptoms/shortness_breath.png',
      'symptom': 'Difficulty breathing',
      'symptomArabic': 'صعوبة في التنفس',
    },
    {
      'pathPic': 'assets/covid_symptoms/sore_throat.png',
      'symptom': 'Sore throat',
      'symptomArabic': 'إلتهاب الحلق',
    },
  ];
  final String? appLanguage;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 340,
      padding: const EdgeInsets.all(16),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: appLanguage == null || appLanguage == 'english'
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.end,
        children: [
          Flexible(
            child: Text(
              appLanguage == null || appLanguage == 'english'
                  ? 'Symptoms of COVID-19:'
                  : 'اعراض المرض:',
              textDirection: appLanguage == null || appLanguage == 'english'
                  ? TextDirection.ltr
                  : TextDirection.rtl,
              style: const TextStyle(
                fontSize: 22,
                fontFamily: 'WeatherIcons',
                letterSpacing: 0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 275,
            child: ListView.builder(
              itemCount: _symptomsImagesAssets.length,
              clipBehavior: Clip.none,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => SizedBox(
                height: 250,
                width: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 170,
                      height: 190,
                      child: Image.asset(
                        _symptomsImagesAssets[index]['pathPic']!,
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(
                      width: 120,
                      child: Text(
                        appLanguage == null || appLanguage == 'english'
                            ? _symptomsImagesAssets[index]['symptom']!
                            : _symptomsImagesAssets[index]['symptomArabic']!,
                        textAlign: TextAlign.center,
                        maxLines: 3,
                        softWrap: true,
                        style: const TextStyle(
                          fontSize: 18,
                          height: 1.1,
                          fontFamily: 'WeatherIcons',
                          letterSpacing: 0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
