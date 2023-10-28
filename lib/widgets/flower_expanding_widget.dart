import 'package:flower_prediction/models/suitable_flower_model.dart';
import 'package:flower_prediction/style.dart';
import 'package:flutter/material.dart';

class FlowerExpandingWidget extends StatefulWidget {
  final SuitableFlowerModel suitableFlowerModel;

  const FlowerExpandingWidget({super.key, required this.suitableFlowerModel});

  @override
  State<FlowerExpandingWidget> createState() => _FlowerExpandingWidgetState();
}

class _FlowerExpandingWidgetState extends State<FlowerExpandingWidget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        height: isExpanded ? size * 0.5 : size * 0.05 + 2,
        width: isExpanded ? size * 0.9 : size * 0.2,
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
                    Text(
                      widget.suitableFlowerModel.flowerName!,
                      style: const TextStyle(
                          color: greenLvl1, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
                    ),
                    Flex(
                      direction: Axis.vertical,
                      children: [
                        itemRow("💧", widget.suitableFlowerModel.water!, context),
                        itemRow("🌱", widget.suitableFlowerModel.soil!, context),
                        itemRow("☀️", widget.suitableFlowerModel.sunlight!, context),
                        itemRow("🍃", widget.suitableFlowerModel.growMethod!, context),
                        itemRow("🩹", widget.suitableFlowerModel.addCare!, context),
                        itemRow("📐", widget.suitableFlowerModel.plantDepth!, context),
                        itemRow("📏", widget.suitableFlowerModel.spacing!, context),
                      ],
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      widget.suitableFlowerModel.flowerName!,
                      style: const TextStyle(color: Colors.white),
                    ),
                    Text(
                      widget.suitableFlowerModel.emoji!,
                      style: const TextStyle(fontSize: 12, decoration: TextDecoration.underline),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

itemRow(String emoji, String text, BuildContext context) {
  return Visibility(
    visible: text != "",
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            emoji,
            style: const TextStyle(fontSize: 12, decoration: TextDecoration.underline),
          ),
          const SizedBox(
            width: 10,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
            child: Text(
              text,
              textAlign: TextAlign.justify,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    ),
  );
}
