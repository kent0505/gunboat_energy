import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:dotted_border/dotted_border.dart';

import '../providers/kana_provider.dart';
import '../widgets/kanauroven.dart';
import '../widgets/sposobnosti.dart';
import '../widgets/statue.dart';

class KanaPage extends StatelessWidget {
  const KanaPage({super.key});

  @override
  Widget build(BuildContext context) {
    var func = context.read<KanaCon>();

    func.initial(); // сразу вызывает эту функцию

    return Consumer<KanaCon>(builder: (context, value, child) {
      print('---CONSUMER---');
      return Stack(
        alignment: Alignment.topCenter,
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                children: [
                  const SizedBox(height: 70),

                  // УРОВЕНЬ КАНОНЕРКИ
                  KanaUroven(
                    name: 'gunboatLvl'.tr(),
                    count: '${value.kanaUroven.round()}',
                    minus: () => func.kana('lvl-'),
                    plus: () => func.kana('lvl+'),
                  ),

                  // ЗДАНИЙ РАЗРУШЕНО
                  KanaUroven(
                    name: 'destroyed'.tr(),
                    count: '${value.zdRa.round()}',
                    minus: () => func.zdaniya('zd-'),
                    plus: () => func.zdaniya('zd+'),
                  ),

                  // ШЕДЕВР
                  Statue(
                    img: 'sh',
                    percent: '${value.shkan.round()}%',
                    funcDust: () => func.dust('sh*'),
                    minus: () => func.minus('sh-'),
                    plus: () => func.plus('sh+'),
                    dustSize: value.shdustsize,
                  ),

                  // ХРАНИТЕЛЬ 1
                  Statue(
                    img: 'hr',
                    percent: '${value.h1kan.round()}%',
                    funcDust: () => func.dust('h1*'),
                    minus: () => func.minus('h1-'),
                    plus: () => func.plus('h1+'),
                    dustSize: value.h1dustsize,
                  ),

                  // ХРАНИТЕЛЬ 2
                  Statue(
                    img: 'hr',
                    percent: '${value.h2kan.round()}%',
                    funcDust: () => func.dust('h2*'),
                    minus: () => func.minus('h2-'),
                    plus: () => func.plus('h2+'),
                    dustSize: value.h2dustsize,
                  ),

                  // ХРАНИТЕЛЬ 3
                  Statue(
                    img: 'hr',
                    percent: '${value.h3kan.round()}%',
                    funcDust: () => func.dust('h3*'),
                    minus: () => func.minus('h3-'),
                    plus: () => func.plus('h3+'),
                    dustSize: value.h3dustsize,
                  ),

                  // ХРАНИТЕЛЬ 4
                  Statue(
                    img: 'hr',
                    percent: '${value.h4kan.round()}%',
                    funcDust: () => func.dust('h4*'),
                    minus: () => func.minus('h4-'),
                    plus: () => func.plus('h4+'),
                    dustSize: value.h4dustsize,
                  ),

                  // ХРАНИТЕЛЬ 5
                  Statue(
                    img: 'hr',
                    percent: '${value.h5kan.round()}%',
                    funcDust: () => func.dust('h5*'),
                    minus: () => func.minus('h5-'),
                    plus: () => func.plus('h5+'),
                    dustSize: value.h5dustsize,
                  ),

                  const SizedBox(height: 10),

                  // ДОП. СТАТУИ
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: DottedBorder(
                      color: Colors.black,
                      strokeWidth: 1,
                      dashPattern: const [6],
                      child: ExpansionTile(
                        leading: const Text(''),
                        title: Center(child: Text('moreStatues'.tr())),
                        backgroundColor: Colors.white,
                        textColor: Colors.black,
                        iconColor: Colors.black,
                        children: [
                          // ХРАНИТЕЛЬ 6
                          Statue(
                            img: 'hr',
                            percent: '${value.h6kan.round()}%',
                            funcDust: () => func.dust('h6*'),
                            minus: () => func.minus('h6-'),
                            plus: () => func.plus('h6+'),
                            dustSize: value.h6dustsize,
                          ),

                          // ХРАНИТЕЛЬ 7
                          Statue(
                            img: 'hr',
                            percent: '${value.h7kan.round()}%',
                            funcDust: () => func.dust('h7*'),
                            minus: () => func.minus('h7-'),
                            plus: () => func.plus('h7+'),
                            dustSize: value.h7dustsize,
                          ),

                          // ХРАНИТЕЛЬ 8
                          Statue(
                            img: 'hr',
                            percent: '${value.h8kan.round()}%',
                            funcDust: () => func.dust('h8*'),
                            minus: () => func.minus('h8-'),
                            plus: () => func.plus('h8+'),
                            dustSize: value.h8dustsize,
                          ),

                          // ХРАНИТЕЛЬ 9
                          Statue(
                            img: 'hr',
                            percent: '${value.h9kan.round()}%',
                            funcDust: () => func.dust('h9*'),
                            minus: () => func.minus('h9-'),
                            plus: () => func.plus('h9+'),
                            dustSize: value.h9dustsize,
                          ),

                          // ХРАНИТЕЛЬ 10
                          Statue(
                            img: 'hr',
                            percent: '${value.h10kan.round()}%',
                            funcDust: () => func.dust('h10*'),
                            minus: () => func.minus('h10-'),
                            plus: () => func.plus('h10+'),
                            dustSize: value.h10dustsize,
                          ),

                          // ХРАНИТЕЛЬ 11
                          Statue(
                            img: 'hr',
                            percent: '${value.h11kan.round()}%',
                            funcDust: () => func.dust('h11*'),
                            minus: () => func.minus('h11-'),
                            plus: () => func.plus('h11+'),
                            dustSize: value.h11dustsize,
                          ),

                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  // АРТИЛЛЕРИЯ
                  Sposobnosti(
                    img: 'artillery',
                    name: 'artillery'.tr(),
                    count: '${value.artilery.round()}',
                    price: '${value.artacost.round()}',
                    minus: () => func.sminus('art-'),
                    plus: () => func.splus('art+'),
                  ),

                  // СИГНАЛЬНАЯ РАКЕТА
                  Sposobnosti(
                    img: 'signal',
                    name: 'signal'.tr(),
                    count: '${value.signal.round()}',
                    price: '${value.signalcost.round()}',
                    minus: () => func.sminus('sig-'),
                    plus: () => func.splus('sig+'),
                  ),

                  // АПТЕЧКА
                  Sposobnosti(
                    img: 'aptechka',
                    name: 'aptechka'.tr(),
                    count: '${value.aptechka.round()}',
                    price: '${value.aptechkacost.round()}',
                    minus: () => func.sminus('apt-'),
                    plus: () => func.splus('apt+'),
                  ),

                  // ШОКОВЫЙ СНАРЯД
                  Sposobnosti(
                    img: 'shock',
                    name: 'shock'.tr(),
                    count: '${value.shock.round()}',
                    price: '${value.shockcost.round()}',
                    minus: () => func.sminus('sho-'),
                    plus: () => func.splus('sho+'),
                  ),

                  // ОБСТРЕЛ
                  Sposobnosti(
                    img: 'obstrel',
                    name: 'obstrel'.tr(),
                    count: '${value.obstrel.round()}',
                    price: '${value.obstrelcost.round()}',
                    minus: () => func.sminus('obs-'),
                    plus: () => func.splus('obs+'),
                  ),

                  // ДЫМОВАЯ ЗАВЕСА
                  Sposobnosti(
                    img: 'dim',
                    name: 'dim'.tr(),
                    count: '${value.dim.round()}',
                    price: '${value.dimcost.round()}',
                    minus: () => func.sminus('dim-'),
                    plus: () => func.splus('dim+'),
                  ),

                  // КРИТТЕРЫ
                  Sposobnosti(
                    img: 'kritteri',
                    name: 'kritteri'.tr(),
                    count: '${value.kritteri.round()}',
                    price: '${value.krittericost.round()}',
                    minus: () => func.sminus('kri-'),
                    plus: () => func.splus('kri+'),
                  ),

                  // БОЕВЫЕ ПРИКАЗЫ
                  Sposobnosti(
                    img: 'brik',
                    name: 'brik'.tr(),
                    count: '${value.brik.round()}',
                    price: '${value.brikcost.round()}',
                    minus: () => func.sminus('bri-'),
                    plus: () => func.splus('bri+'),
                  ),

                  // УДАЛЕННЫЙ ВЗЛОМ
                  Sposobnosti(
                    img: 'pult',
                    name: 'pult'.tr(),
                    count: '${value.pult.round()}',
                    price: '${value.pultcost.round()}',
                    minus: () => func.sminus('pul-'),
                    plus: () => func.splus('pul+'),
                  ),

                  // ВЫЗОВ
                  Sposobnosti(
                    img: 'bullit',
                    name: 'bullit'.tr(),
                    count: '${value.bullit.round()}',
                    price: '${value.bullitcost.round()}',
                    minus: () => func.sminus('bul-'),
                    plus: () => func.splus('bul+'),
                  ),

                  const SizedBox(height: 50),
                ],
              ),
            ),
          ),

          // ЗАРЯД КАНОНЕРКИ
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Chip(
              label: SizedBox(
                width: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Spacer(),
                    Image.asset('assets/images/kana.png', height: 20),
                    const SizedBox(width: 4),
                    Text(
                      '${value.kanaZaryad.round()}',
                      style: const TextStyle(fontSize: 20),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
              elevation: 2,
              padding: const EdgeInsets.all(12),
            ),
          ),
        ],
      );
    });
  }
}
