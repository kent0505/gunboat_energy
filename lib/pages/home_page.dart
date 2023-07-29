import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:easy_localization/easy_localization.dart';

import '../ads/ad_helper.dart';
import '../providers/kana_provider.dart';
import '../providers/uron_provider.dart';
import '../widgets/drawer.dart';
import './kana_page.dart';
import './uron_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  BannerAd? banner;

  @override
  void initState() {
    super.initState();
    BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            banner = ad as BannerAd;
          });
        },
        onAdFailedToLoad: (ad, err) {
          print('Failed to load a banner ad: ${err.message}');
          ad.dispose();
        },
      ),
    ).load();
  }

  @override
  void dispose() {
    banner!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Gunboat Energy',
            style: TextStyle(letterSpacing: 6),
          ),
          bottom: TabBar(tabs: [
            Tab(text: 'tabText1'.tr()),
            Tab(text: 'tabText2'.tr()),
          ]),
        ),
        body: Stack(
          children: [
            TabBarView(
              children: [
                ChangeNotifierProvider(
                  create: (context) => KanaCon(),
                  child: const KanaPage(),
                ),
                ChangeNotifierProvider(
                  create: (context) => UronCon(),
                  child: const UronPage(),
                ),
              ],
            ),
            if (banner != null)
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: banner!.size.width.toDouble(),
                  height: banner!.size.height.toDouble(),
                  child: AdWidget(ad: banner!),
                ),
              ),
          ],
        ),
        drawer: const MainDrawer(),
      ),
    );
  }
}
