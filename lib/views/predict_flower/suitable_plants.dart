import 'package:flower_prediction/utils/static/app_assets.dart';
import 'package:flower_prediction/utils/static/app_strings.dart';
import 'package:flower_prediction/viewmodels/predict_flower_viewmodel.dart';
import 'package:flower_prediction/widgets/custom_app_bar.dart';
import 'package:flower_prediction/widgets/expanding_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SuitablePlants extends StatelessWidget {
  const SuitablePlants({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(35.0),
          child: CustomAppBar(
            title: AppStrings.plantPredictionMostSuitablePlant,
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
              itemCount: model.suitablePlants.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: ExpandingTextWidget(suitableFlowerModel: model.suitablePlants[index]),
                );
              }),
        );
      }),
    );
  }
}
