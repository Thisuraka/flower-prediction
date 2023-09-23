import 'package:flower_prediction/style.dart';
import 'package:flower_prediction/utils/app_strings.dart';
import 'package:flower_prediction/viewmodels/flower_viewmodel.dart';
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
          ),
          child: Consumer<FlowerViewModel>(builder: (context, model, child) {
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
                    index == 0 ? model.isCamera = true : model.isCamera = false;
                  },
                ),
                Row(
                  children: [
                    HomeTileWidget(
                      asset: 'assets/images/home_tile_disease.png',
                      title: AppStrings.diseaseDetection,
                      onTap: () {},
                    ),
                    HomeTileWidget(
                      asset: 'assets/images/home_tile_flower.png',
                      title: AppStrings.predictFlower,
                      onTap: () {},
                    ),
                  ],
                ),
                Row(
                  children: [
                    HomeTileWidget(
                      asset: 'assets/images/home_tile_growth.png',
                      title: AppStrings.plantGrowth,
                      onTap: () {},
                    ),
                    HomeTileWidget(
                      asset: 'assets/images/home_tile_distance.png',
                      title: AppStrings.vendorProximity,
                      onTap: () {},
                    ),
                  ],
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
