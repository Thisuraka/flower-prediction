import 'package:flower_prediction/style.dart';
import 'package:flower_prediction/utils/static/app_assets.dart';
import 'package:flower_prediction/utils/static/app_strings.dart';
import 'package:flower_prediction/viewmodels/predict_flower_viewmodel.dart';
import 'package:flower_prediction/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PredictFlower extends StatefulWidget {
  const PredictFlower({super.key});

  @override
  State<PredictFlower> createState() => _PredictFlowerState();
}

class _PredictFlowerState extends State<PredictFlower> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(35.0),
          child: CustomAppBar(
            title: "",
            removeBg: true,
          )),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.only(top: 50),
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppAssets.homeBg),
              fit: BoxFit.cover,
            ),
            color: Colors.transparent),
        child: Consumer<PredictFlowerViewModel>(builder: (context, model, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                AppStrings.plantPredictionMostPickWhich,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 50,
              ),
              InkWell(
                onTap: () {
                  model.processMostSuitablePlant();
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: 100,
                  decoration: const BoxDecoration(
                      color: greenLvl4, borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '☀️',
                        style: TextStyle(fontSize: 30),
                      ),
                      Text(
                        AppStrings.plantPredictionWeatherPrediction,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: 100,
                  decoration: const BoxDecoration(
                      color: greenLvl5, borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '🌿',
                        style: TextStyle(fontSize: 30),
                      ),
                      Text(
                        AppStrings.plantPredictionMostSuitablePlant,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}
