import 'package:flutter/material.dart';

class TreatmentAccordionWidget extends StatelessWidget {
  const TreatmentAccordionWidget({super.key, this.icon, required this.title, required this.content});

  final Icon? icon;
  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      collapsedIconColor: Colors.white,
      iconColor: Colors.white,
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            width: 10.0,
          ),
          Text(
            title,
            style: const TextStyle(color: Colors.white),
          )
        ],
      ),
      children: <Widget>[
        ListTile(
          title: Text(
            content,
            textAlign: TextAlign.justify,
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
          ),
        ),
      ],
    );
  }
}
