import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:intl/intl.dart' as intl;

import '../providers/uron_provider.dart';
import '../widgets/rows.dart';
import '../widgets/zuki.dart';
import '../widgets/statue.dart';

class UronPage extends StatelessWidget {
  const UronPage({super.key});

  @override
  Widget build(BuildContext context) {
    var func = context.read<UronCon>();

    func.initial(); // сразу вызывает эту функцию

    return Consumer<UronCon>(builder: (context, value, child) {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
            child: Card(
              elevation: 5,
              shadowColor: Colors.blueGrey,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.blueGrey,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Rows(
                        name: 'armyDamage'.tr(),
                        txt: '${value.obwiyuron.toStringAsFixed(0)}%',
                      ),
                      Rows(
                        name: 'damageSec'.tr(),
                        txt: intl.NumberFormat.decimalPattern().format(
                          value.zuki.round(),
                        ),
                      ),
                      Rows(
                        name: 'damageShot'.tr(),
                        txt: intl.NumberFormat.decimalPattern().format(
                          value.zuki.round() * 2,
                        ),
                      ),
                      Rows(
                        name: 'damage11'.tr(),
                        txt: intl.NumberFormat.decimalPattern().format(
                          value.zuki.round() * 11,
                        ),
                      ),
                      Rows(
                        name: 'damageBrik'.tr(),
                        txt: intl.NumberFormat.decimalPattern().format(
                          value.zukibrik.round(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    // БАЗУКА
                    Row(
                      children: [
                        Image.asset('assets/images/zuka.png', height: 50),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            children: [
                              // УРОВЕНЬ БАЗУК
                              Zuki(
                                name: '${value.urZuk.round()} lvl',
                                minus: () => func.zukiFunc('lvl-'),
                                plus: () => func.zukiFunc('lvl+'),
                              ),

                              // КОЛИЧЕСТВО БАЗУК
                              Zuki(
                                name: 'x${value.count.round()}',
                                minus: () => func.zukiFunc('count-'),
                                plus: () => func.zukiFunc('count+'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    // ШЕДЕВР
                    Statue(
                      img: 'shedevruron',
                      percent: '${value.uronsh.round()}%',
                      funcDust: () => func.dust('sh*'),
                      minus: () => func.minus('sh-'),
                      plus: () => func.plus('sh+'),
                      dustSize: value.shdustsize,
                    ),

                    // ХРАНИТЕЛЬ 1
                    Statue(
                      img: 'hraniteluron',
                      percent: '${value.uronhr1.round()}%',
                      funcDust: () => func.dust('hr1*'),
                      minus: () => func.minus('hr1-'),
                      plus: () => func.plus('hr1+'),
                      dustSize: value.h1dustsize,
                    ),

                    // ХРАНИТЕЛЬ 2
                    Statue(
                      img: 'hraniteluron',
                      percent: '${value.uronhr2.round()}%',
                      funcDust: () => func.dust('hr2*'),
                      minus: () => func.minus('hr2-'),
                      plus: () => func.plus('hr2+'),
                      dustSize: value.h2dustsize,
                    ),

                    // ХРАНИТЕЛЬ 3
                    Statue(
                      img: 'hraniteluron',
                      percent: '${value.uronhr3.round()}%',
                      funcDust: () => func.dust('hr3*'),
                      minus: () => func.minus('hr3-'),
                      plus: () => func.plus('hr3+'),
                      dustSize: value.h3dustsize,
                    ),

                    // ХРАНИТЕЛЬ 4
                    Statue(
                      img: 'hraniteluron',
                      percent: '${value.uronhr4.round()}%',
                      funcDust: () => func.dust('hr4*'),
                      minus: () => func.minus('hr4-'),
                      plus: () => func.plus('hr4+'),
                      dustSize: value.h4dustsize,
                    ),

                    // ХРАНИТЕЛЬ 5
                    Statue(
                      img: 'hraniteluron',
                      percent: '${value.uronhr5.round()}%',
                      funcDust: () => func.dust('hr5*'),
                      minus: () => func.minus('hr5-'),
                      plus: () => func.plus('hr5+'),
                      dustSize: value.h5dustsize,
                    ),

                    // ХРАНИТЕЛЬ 6
                    Statue(
                      img: 'hraniteluron',
                      percent: '${value.uronhr6.round()}%',
                      funcDust: () => func.dust('hr6*'),
                      minus: () => func.minus('hr6-'),
                      plus: () => func.plus('hr6+'),
                      dustSize: value.h6dustsize,
                    ),

                    // ХРАНИТЕЛЬ 7
                    Statue(
                      img: 'hraniteluron',
                      percent: '${value.uronhr7.round()}%',
                      funcDust: () => func.dust('hr7*'),
                      minus: () => func.minus('hr7-'),
                      plus: () => func.plus('hr7+'),
                      dustSize: value.h7dustsize,
                    ),

                    // ХРАНИТЕЛЬ 8
                    Statue(
                      img: 'hraniteluron',
                      percent: '${value.uronhr8.round()}%',
                      funcDust: () => func.dust('hr8*'),
                      minus: () => func.minus('hr8-'),
                      plus: () => func.plus('hr8+'),
                      dustSize: value.h8dustsize,
                    ),

                    // ХРАНИТЕЛЬ 9
                    Statue(
                      img: 'hraniteluron',
                      percent: '${value.uronhr9.round()}%',
                      funcDust: () => func.dust('hr9*'),
                      minus: () => func.minus('hr9-'),
                      plus: () => func.plus('hr9+'),
                      dustSize: value.h9dustsize,
                    ),

                    // ХРАНИТЕЛЬ 10
                    Statue(
                      img: 'hraniteluron',
                      percent: '${value.uronhr10.round()}%',
                      funcDust: () => func.dust('hr10*'),
                      minus: () => func.minus('hr10-'),
                      plus: () => func.plus('hr10+'),
                      dustSize: value.h10dustsize,
                    ),

                    // ХРАНИТЕЛЬ 11
                    Statue(
                      img: 'hraniteluron',
                      percent: '${value.uronhr11.round()}%',
                      funcDust: () => func.dust('hr11*'),
                      minus: () => func.minus('hr11-'),
                      plus: () => func.plus('hr11+'),
                      dustSize: value.h11dustsize,
                    ),

                    const SizedBox(height: 50),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}
