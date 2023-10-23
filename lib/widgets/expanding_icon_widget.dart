import 'package:flutter/material.dart';

class ExpandingIconWidget extends StatefulWidget {
  final IconData icon;
  final String title;
  final String desc;

  const ExpandingIconWidget({super.key, required this.icon, required this.title, required this.desc});

  @override
  State<ExpandingIconWidget> createState() => _ExpandingIconWidgetState();
}

class _ExpandingIconWidgetState extends State<ExpandingIconWidget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        height: isExpanded ? size * 0.4 : size * 0.1 + 2,
        width: isExpanded ? size * 0.9 : size * 0.7,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: const Color(0x37BEBEBE),
          borderRadius: BorderRadius.circular(isExpanded ? 20.0 : 20.0),
        ),
        child: SingleChildScrollView(
          child: isExpanded
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          widget.icon,
                          size: 20.0,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          widget.title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      widget.desc,
                      textAlign: TextAlign.justify,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      widget.icon,
                      size: 20.0,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      widget.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
