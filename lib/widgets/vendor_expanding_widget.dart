import 'package:flower_prediction/models/closest_vendors.dart';
import 'package:flower_prediction/style.dart';
import 'package:flower_prediction/utils/static/app_strings.dart';
import 'package:flutter/material.dart';

class VendorExpandingWidget extends StatefulWidget {
  final ClosestVendorsModel closestVendorModel;
  final Function()? goToDirections;
  final Function()? goToPriceEstimate;

  const VendorExpandingWidget(
      {super.key,
      required this.closestVendorModel,
      required this.goToDirections,
      required this.goToPriceEstimate});

  @override
  State<VendorExpandingWidget> createState() => _FlowerExpandingWidgetState();
}

class _FlowerExpandingWidgetState extends State<VendorExpandingWidget> {
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
        height: isExpanded ? size * 0.25 : size * 0.05 + 2,
        width: size * 0.9,
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
                      '${widget.closestVendorModel.distance.toStringAsFixed(2)} KM away',
                      style: const TextStyle(
                          color: greenLvl1, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
                    ),
                    Flex(
                      direction: Axis.vertical,
                      children: [
                        itemRow(
                            "⭐",
                            "${AppStrings.plantVendorRating}: ${widget.closestVendorModel.avgRating}",
                            context),
                        itemRow(
                            "🏷️",
                            "${AppStrings.plantVendorAvgPrice}: ${widget.closestVendorModel.avgPrice}",
                            context),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(top: 10),
                          alignment: Alignment.bottomRight,
                          child: InkWell(
                            onTap: widget.goToPriceEstimate,
                            child: const Text(
                              "${AppStrings.plantVendorPriceEstimate} 🧾",
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 10),
                          alignment: Alignment.bottomRight,
                          child: InkWell(
                            onTap: widget.goToDirections,
                            child: const Text(
                              "${AppStrings.plantVendorDirections} ➤",
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '${widget.closestVendorModel.distance.toStringAsFixed(2)} KM away',
                      style: const TextStyle(color: Colors.white),
                    ),
                    const Text(
                      "📍",
                      style: TextStyle(fontSize: 12, decoration: TextDecoration.underline),
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
