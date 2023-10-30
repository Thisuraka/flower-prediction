import 'package:flower_prediction/models/weather_model.dart';
import 'package:flower_prediction/utils/static/app_assets.dart';
import 'package:flower_prediction/utils/static/app_strings.dart';
import 'package:flower_prediction/viewmodels/predict_flower_viewmodel.dart';
import 'package:flower_prediction/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WeatherPrediction extends StatelessWidget {
  const WeatherPrediction({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(35.0),
          child: CustomAppBar(
            title: AppStrings.plantPredictionWeatherPrediction,
            removeBg: true,
          )),
      body: Consumer<PredictFlowerViewModel>(builder: (context, model, child) {
        return Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.only(top: 50),
          decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppAssets.homeBg),
                fit: BoxFit.cover,
              ),
              color: Colors.transparent),
          child: ListView.builder(
              itemCount: model.predictedWeather.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: tempItem(context, model.predictedWeather[index]),
                );
              }),
        );
      }),
    );
  }

  tempItem(BuildContext context, WeatherModel model) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: const BoxDecoration(
            color: Color(0xFF384D3D), borderRadius: BorderRadius.all(Radius.circular(10))),
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    model.date,
                    textAlign: TextAlign.start,
                    style: const TextStyle(fontSize: 18.0),
                  ),
                  const Text(
                    '🌿',
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 14.0),
                  ),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(top: 10),
                decoration: const BoxDecoration(
                    color: Color(0x2AC2C2C2), borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    ' 🌡️    ${model.temperature.toStringAsFixed(1)}°C',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(top: 10),
                decoration: const BoxDecoration(
                    color: Color(0x2AC2C2C2), borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    ' 🌧️    ${model.rainfall.toStringAsFixed(1)}',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(top: 10),
                decoration: const BoxDecoration(
                    color: Color(0x2AC2C2C2), borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    ' 🌬️    ${model.windspeed.toStringAsFixed(1)}',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
