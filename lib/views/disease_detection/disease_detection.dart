import 'dart:io';

import 'package:flower_prediction/utils/static/app_assets.dart';
import 'package:flower_prediction/utils/static/app_strings.dart';
import 'package:flower_prediction/viewmodels/disease_viewmodel.dart';
import 'package:flower_prediction/views/disease_detection/widgets/treatment_accordion_widget.dart';
import 'package:flower_prediction/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DiseaseDetection extends StatelessWidget {
  const DiseaseDetection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(35.0), child: CustomAppBar(title: AppStrings.detectedDisease)),
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.homeBg),
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
        child: Consumer<DiseaseViewModel>(builder: (context, model, child) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  //Flower image
                  Container(
                    height: MediaQuery.of(context).size.height / 4,
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
                  Text(
                    model.diseaseModel.disease!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    model.diseaseModel.description!,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(color: Colors.white),
                  ),

                  const SizedBox(
                    height: 20.0,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: ListView.builder(
                      itemCount: model.diseaseModel.treatmentPlan!.length,
                      itemBuilder: (context, index) {
                        return TreatmentAccordionWidget(
                          title: model.diseaseModel.treatmentPlan![index]!.plan!,
                          content: model.diseaseModel.treatmentPlan![index]!.desc!,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
