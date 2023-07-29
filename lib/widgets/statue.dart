import 'package:flutter/material.dart';

class Statue extends StatelessWidget {
  final String img;
  final String percent;
  final VoidCallback funcDust;
  final VoidCallback minus;
  final VoidCallback plus;
  final double dustSize;

  const Statue({
    super.key,
    required this.img,
    required this.percent,
    required this.funcDust,
    required this.minus,
    required this.plus,
    required this.dustSize,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Transform.scale(
          scaleX: -1,
          child: Image.asset(
            'assets/images/$img.png',
            height: img == 'sh1' || img == 'shedevruron' ? 55 : 50,
            width: img == 'sh1' || img == 'shedevruron' ? 55 : 50,
          ),
        ),
        SizedBox(width: img == 'sh1' || img == 'shedevruron' ? 0 : 5),
        Text(percent, style: const TextStyle(fontSize: 18)),
        const Spacer(),
        Container(
          height: 10,
          width: 10,
          decoration: BoxDecoration(
            color: dustSize == 25 ? Colors.green[500] : Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        const SizedBox(width: 8),
        ElevatedButton(
          onPressed: funcDust,
          child: Image.asset(
            'assets/images/dust.png',
            height: dustSize,
          ),
        ),
        const SizedBox(width: 8),
        ElevatedButton(
          onPressed: minus,
          child: const Icon(Icons.chevron_left),
        ),
        const SizedBox(width: 8),
        ElevatedButton(
          onPressed: plus,
          child: const Icon(Icons.chevron_right),
        ),
        const SizedBox(width: 8),
      ],
    );
  }
}
