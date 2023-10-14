import 'package:flower_prediction/style.dart';
import 'package:flower_prediction/utils/app_strings.dart';
import 'package:flower_prediction/utils/enums/processor_type.dart';
import 'package:flower_prediction/viewmodels/flower_viewmodel.dart';
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
          child: Consumer<FlowerViewModel>(builder: (context, model, child) {
            return Column(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                        model.addImage(context, ProcessorType.disease);
                      },
                    ),
                    HomeTileWidget(
                      asset: 'assets/images/home_tile_flower.png',
                      title: AppStrings.predictFlower,
                      onTap: () {
                        model.addImage(context, ProcessorType.predictFlower);
                      },
                    ),
                    HomeTileWidget(
                      asset: 'assets/images/home_tile_growth.png',
                      title: AppStrings.plantGrowth,
                      onTap: () {
                        model.addImage(context, ProcessorType.growth);
                      },
                    ),
                    HomeTileWidget(
                      asset: 'assets/images/home_tile_distance.png',
                      title: AppStrings.vendorProximity,
                      onTap: () {
                        // model.addImage(context, ProcessorType.vendor);
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