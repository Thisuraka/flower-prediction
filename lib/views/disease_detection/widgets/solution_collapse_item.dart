import 'package:flutter/material.dart';

class TreatmentAccordionWidget extends StatelessWidget {
  const TreatmentAccordionWidget({super.key, this.icon, required this.title, required this.contentWidget});

  final Icon? icon;
  final String title;
  final Widget contentWidget;

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
      // subtitle: Text('Trailing expansion arrow icon'),
      children: <Widget>[contentWidget],
    );
  }
}
