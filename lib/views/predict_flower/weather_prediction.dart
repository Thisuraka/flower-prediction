import 'package:flower_prediction/utils/static/app_assets.dart';
import 'package:flutter/material.dart';

class WeatherPrediction extends StatelessWidget {
  WeatherPrediction({super.key});
  final List<String> list = <String>['Month', 'Week'];
  final List months = ['1st', '2nd', '3rd', '4th'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Prediction'),
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
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  const Text('Select Frequency:'),
                  const SizedBox(
                    width: 20.0,
                  ),
                  DropdownButton<String>(
                    value: list.first,
                    icon: const Icon(Icons.arrow_downward),
                    elevation: 16,
                    style: const TextStyle(color: Colors.white),
                    underline: Container(
                      height: 2,
                      color: Colors.white,
                    ),
                    onChanged: (String? value) {
                      // This is called when the user selects an item.
                    },
                    items: list.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 43, 94, 55),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: const Text(
                          '1st Month',
                          textAlign: TextAlign.start,
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: const BoxDecoration(
                              color: Colors.grey, borderRadius: BorderRadius.all(Radius.circular(10))),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('🌤️ Sunny with clouds'),
                          ))
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 43, 94, 55),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: const Text(
                          '2nd Month',
                          textAlign: TextAlign.start,
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: const BoxDecoration(
                              color: Colors.grey, borderRadius: BorderRadius.all(Radius.circular(10))),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('🌧️ Rainy'),
                          ))
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 43, 94, 55),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: const Text(
                          '3rd Month',
                          textAlign: TextAlign.start,
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: const BoxDecoration(
                              color: Colors.grey, borderRadius: BorderRadius.all(Radius.circular(10))),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('💦 Drizzle'),
                          ))
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
