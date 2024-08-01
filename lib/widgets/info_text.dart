import 'package:flutter/material.dart';

class InfoText extends StatelessWidget {
  const InfoText({
    super.key,
    required this.label,
    required this.info,
  });

  final String label;
  final String info;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: label,
        style: Theme.of(context).textTheme.titleMedium,
        children: [
          TextSpan(
            text: info,
            style: TextStyle( fontSize: 15, fontWeight: FontWeight.w400)
          )
        ],
      ),
    );
  }
}
