import 'package:flower_prediction/models/growth_model.dart';

List<GrowthModel> growthStatic = [
  GrowthModel(
    key: "critically_undergrown",
    status: "Critically under grown ",
    desc:
        "The plant's growth is severely below what is expected for its age, and the suggested fertilizer plan is an attempt to address and improve the situation.",
    fertilAmount:
        "Use fertilizer with N-P-K ratios with 20-20-20.                        (grams per square meter (g/m²), For example, if you want to apply 100 grams of a 20-20-20 fertilizer per square meter, you would apply 20 grams of nitrogen, 20 grams of phosphorus, and 20 grams of potassium.)",
    fertilTiming: "Fertilize during the active growing season",
    appFreq: "Apply fertilizer every 2-4 weeks, adjusting per the specific product's recommendations.",
    appMethod:
        "Water the plant a day or two before applying fertilizer. Apply around the base, avoiding direct contact with stems or leaves.",
    flushWithWater:
        "Water the anthurium after fertilization to help nutrients reach the root zone and prevent buildup.",
    monitorAndAdjust:
        "Watch for signs of over-fertilization and adjust the amount and frequency accordingly.",
    soilQuality: "Ensure well-draining, organic-rich soil for anthuriums.",
  ),
  GrowthModel(
    key: "midly_undergrown",
    status: "Mildly under grown ",
    desc:
        "The plant's growth is not meeting expectations for its age, and the suggested fertilizer plan is aimed at improving its growth.",
    fertilAmount: "",
    fertilTiming: "",
    appFreq: "",
    appMethod: "",
    flushWithWater: "",
    monitorAndAdjust: "",
    soilQuality: "",
  ),
  GrowthModel(
    key: "healthy",
    status: "Healthy",
    desc:
        "The plant's growth is satisfactory for its age. You can use this fertilizer plan to maintain its health.",
    fertilAmount: "",
    fertilTiming: "",
    appFreq: "",
    appMethod: "",
    flushWithWater: "",
    monitorAndAdjust: "",
    soilQuality: "",
  ),
  GrowthModel(
    key: "midly_undergrown",
    status: "Mildly over grown ",
    desc:
        "The plant's growth has exceeded the expected size for its age. It may benefit from a lighter fertilizer plan to maintain its current size without promoting excessive growth.",
    fertilAmount: "",
    fertilTiming: "",
    appFreq: "",
    appMethod: "",
    flushWithWater: "",
    monitorAndAdjust: "",
    soilQuality: "",
  ),
  GrowthModel(
    key: "critically_overgrown",
    status: "Critically  over grown ",
    desc:
        "The plant's growth is severely below what is expected for its age, and the suggested fertilizer plan is an attempt to address and improve the situation.",
    fertilAmount: "",
    fertilTiming: "",
    appFreq: "",
    appMethod: "",
    flushWithWater: "",
    monitorAndAdjust: "",
    soilQuality: "",
  ),
];
