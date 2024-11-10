import 'package:flutter/material.dart';

class RoundedText extends StatelessWidget {
  const RoundedText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(60),
      ),
      child: Text(text),
    );
  }
}
