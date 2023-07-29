import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class Rows extends StatelessWidget {
  final String name;
  final String txt;

  const Rows({
    super.key,
    required this.name,
    required this.txt,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Row(
        children: [
          Text(
            name,
            style: const TextStyle(fontSize: 20, color: Colors.white),
          ),
          const Spacer(),
          name == 'armyDamage'.tr()
              ? Image.asset('assets/images/uron.png', height: 30)
              : Container(),
          Text(
            txt,
            style: const TextStyle(fontSize: 20, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
