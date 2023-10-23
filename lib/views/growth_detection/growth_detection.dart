import 'dart:io';

import 'package:flower_prediction/utils/static/app_assets.dart';
import 'package:flower_prediction/utils/static/app_strings.dart';
import 'package:flower_prediction/viewmodels/growth_viewmodel.dart';
import 'package:flower_prediction/widgets/custom_app_bar.dart';
import 'package:flower_prediction/widgets/expanding_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GrowthDetection extends StatelessWidget {
  const GrowthDetection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(35.0),
          child: CustomAppBar(
            title: AppStrings.growthAnalysis,
            removeBg: false,
          )),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.homeBg),
            fit: BoxFit.cover,
          ),
          gradient: LinearGradient(
            colors: [
              Color(0xFF35553D),
              Color(0xFF496B4F),
            ],
            begin: FractionalOffset(0.0, 0.0),
            end: FractionalOffset(1.0, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp,
          ),
        ),
        child: SingleChildScrollView(
          child: Consumer<GrowthViewModel>(builder: (context, model, child) {
            return Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  margin: const EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.file(File(model.imageFile!.path)),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  model.growthModel.status!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 22.0, color: Colors.white, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  model.growthModel.desc!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                ExpandingIconWidget(
                  icon: Icons.food_bank,
                  title: "Right Fertilizer amount",
                  desc: model.growthModel.fertilAmount!,
                ),
                ExpandingIconWidget(
                  icon: Icons.watch,
                  title: "Timing of Fertilization",
                  desc: model.growthModel.fertilTiming!,
                ),
                ExpandingIconWidget(
                  icon: Icons.numbers,
                  title: "Application Frequency",
                  desc: model.growthModel.appFreq!,
                ),
                ExpandingIconWidget(
                  icon: Icons.merge_type_sharp,
                  title: "Application Method",
                  desc: model.growthModel.appMethod!,
                ),
                ExpandingIconWidget(
                  icon: Icons.water,
                  title: "Flush with Water",
                  desc: model.growthModel.flushWithWater!,
                ),
                ExpandingIconWidget(
                  icon: Icons.monitor,
                  title: "Monitor and Adjust",
                  desc: model.growthModel.monitorAndAdjust!,
                ),
                ExpandingIconWidget(
                  icon: Icons.nature,
                  title: "Soil Quality",
                  desc: model.growthModel.soilQuality!,
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
