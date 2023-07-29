import 'package:flutter/material.dart';

class Sposobnosti extends StatelessWidget {
  final String img;
  final String name;
  final String price;
  final String count;
  final VoidCallback minus;
  final VoidCallback plus;

  const Sposobnosti({
    super.key,
    required this.img,
    required this.name,
    required this.price,
    required this.count,
    required this.minus,
    required this.plus,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Transform.scale(
          scaleX: -1,
          child: Image.asset('assets/images/$img.png', height: 50, width: 50),
        ),
        const SizedBox(width: 10),
        Text(name, style: const TextStyle(fontSize: 18)),
        const SizedBox(width: 6),
        Text('($price)', style: const TextStyle(fontSize: 18)),
        const Spacer(),
        Text(count, style: const TextStyle(fontSize: 18)),
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
