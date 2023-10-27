import 'package:flower_prediction/utils/static/app_assets.dart';
import 'package:flower_prediction/utils/static/app_strings.dart';
import 'package:flower_prediction/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class WeatherPrediction extends StatelessWidget {
  WeatherPrediction({super.key});
  final List<String> list = <String>['Month', 'Week'];
  final List months = ['1st', '2nd', '3rd', '4th'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(35.0),
          child: CustomAppBar(
            title: AppStrings.plantPredictionWeatherPrediction,
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
        child: Column(
          children: [
            Padding(
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
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '1st Month',
                            textAlign: TextAlign.start,
                            style: TextStyle(fontSize: 18.0),
                          ),
                          Text(
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
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              '🌡️  °C',
                              style: TextStyle(color: Colors.white),
                            ),
                          ))
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
