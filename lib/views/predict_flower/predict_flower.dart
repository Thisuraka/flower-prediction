import 'package:flower_prediction/utils/static/app_assets.dart';
import 'package:flower_prediction/views/suitable_plants/suitable_plants.dart';
import 'package:flower_prediction/views/weather_prediction/weather_prediction.dart';
import 'package:flutter/material.dart';

class PredictFlower extends StatelessWidget {
  const PredictFlower({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plants'),
        actions: const <Widget>[],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.only(top: 50),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.homeBg),
            fit: BoxFit.cover,
          ),
          gradient: LinearGradient(
            colors: [
              Color(0xFF4E6153),
              Color(0xFF496B4F),
            ],
            begin: FractionalOffset(0.0, 0.0),
            end: FractionalOffset(1.0, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {},
                      child: Card(
                        elevation: 10.0,
                        child: Container(
                          color: const Color(0x622B5E37),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              '📈 \nTrending \nPlants',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => WeatherPrediction()),
                        );
                      },
                      child: Card(
                        elevation: 10.0,
                        child: Container(
                          color: const Color(0x622B5E37),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              '☀️\nWeather Prediction',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 20.0),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const SuitablePlants()),
                        );
                      },
                      child: Card(
                        elevation: 10.0,
                        child: Container(
                          color: const Color(0x622B5E37),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              '✨\nMost Suitable \n Plant',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
