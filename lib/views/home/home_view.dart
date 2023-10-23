import 'package:flower_prediction/style.dart';
import 'package:flower_prediction/utils/app_strings.dart';
import 'package:flower_prediction/viewmodels/growth_viewmodel.dart';
import 'package:flower_prediction/viewmodels/home_viewmodel.dart';
import 'package:flower_prediction/viewmodels/predict_flower_viewmodel.dart';
import 'package:flower_prediction/views/disease_detection/disease_detection.dart';
import 'package:flower_prediction/views/map/vendor_map.dart';
import 'package:flower_prediction/widgets/home_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.only(top: 50),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/home_bg.png"),
              fit: BoxFit.cover,
            ),
            gradient: LinearGradient(
              colors: [
                Color(0xFF6A9976),
                Color(0xFF6E8772),
              ],
              begin: FractionalOffset(0.0, 0.0),
              end: FractionalOffset(1.0, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp,
            ),
          ),
          child: Consumer<HomeViewModel>(builder: (context, homeModel, child) {
            return Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 3.5,
                  child: Image.asset(
                    'assets/images/logo.png',
                    height: 100,
                  ),
                ),
                ToggleSwitch(
                  initialLabelIndex: 0,
                  totalSwitches: 2,
                  activeBgColor: const [greenLvl1],
                  inactiveBgColor: Colors.black26,
                  labels: const [
                    'Camera',
                    'Gallery',
                  ],
                  onToggle: (index) {
                    index == 0 ? homeModel.isCamera = true : homeModel.isCamera = false;
                  },
                ),
                Expanded(
                    child: GridView.count(
                  primary: false,
                  padding: const EdgeInsets.all(20),
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  crossAxisCount: 2,
                  children: <Widget>[
                    HomeTileWidget(
                      asset: 'assets/images/home_tile_disease.png',
                      title: AppStrings.diseaseDetection,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const DiseaseDetection()),
                        );
                      },
                    ),
                    Consumer<PredictFlowerViewModel>(builder: (context, model, child) {
                      return HomeTileWidget(
                        asset: 'assets/images/home_tile_flower.png',
                        title: AppStrings.predictFlower,
                        onTap: () {
                          model.addInputs(context);},
                      );
                    }),
                    Consumer<GrowthViewModel>(builder: (context, model, child) {
                      return HomeTileWidget(
                        asset: 'assets/images/home_tile_growth.png',
                        title: AppStrings.plantGrowth,
                        onTap: () {
                          model.addImage(context, homeModel.isCamera);
                        },
                      );
                    }),
                    HomeTileWidget(
                      asset: 'assets/images/home_tile_distance.png',
                      title: AppStrings.vendorProximity,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const VendorMap()),
                        );
                      },
                    ),
                  ],
                ))
              ],
            );
          }),
        ),
      ),
    );
  }
}
