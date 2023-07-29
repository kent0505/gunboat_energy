import 'package:flutter/material.dart';

class KanaUroven extends StatelessWidget {
  final String name;
  final String count;
  final VoidCallback minus;
  final VoidCallback plus;

  const KanaUroven({
    super.key,
    required this.name,
    required this.count,
    required this.minus,
    required this.plus,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(name, style: const TextStyle(fontSize: 18)),
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
