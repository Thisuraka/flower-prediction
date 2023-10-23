import 'package:flutter/material.dart';

class SolutionCollapseItem extends StatelessWidget {
  const SolutionCollapseItem({super.key, required this.icon, required this.title, required this.contentWidget});

  final IconData icon;
  final String title;
  final Widget contentWidget;

  @override
  Widget build(BuildContext context) {
    return  ExpansionTile(
      collapsedIconColor: Colors.white,
      iconColor: Colors.white,
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 24.0,
          ),
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
      children: <Widget>[
        contentWidget
      ],
    );
  }
}
