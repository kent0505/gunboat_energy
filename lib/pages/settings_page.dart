import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import './home_page.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('settings'.tr()),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  'lang'.tr(),
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: context.locale == const Locale('en')
                              ? (Colors.blueGrey[300])!
                              : Colors.white12,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: GestureDetector(
                        onTap: () async {
                          await context.setLocale(const Locale('en')).then(
                            (value) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const HomePage(),
                                ),
                              );
                            },
                          );
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/images/eng.png',
                            height: 50,
                          ),
                        ),
                      ),
                    ),
                    const Text(
                      'EN',
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: context.locale == const Locale('ru')
                              ? (Colors.blueGrey[300])!
                              : Colors.white12,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: GestureDetector(
                        onTap: () async {
                          await context.setLocale(const Locale('ru')).then(
                            (value) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const HomePage(),
                                ),
                              );
                            },
                          );
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/images/rus.png',
                            height: 50,
                          ),
                        ),
                      ),
                    ),
                    const Text(
                      'RU',
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
