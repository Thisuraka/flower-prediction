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
          preferredSize: Size.fromHeight(35.0),
          child: CustomAppBar(
            title: AppStrings.detectedDisease,
            removeBg: true,
          )),
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.homeBg),
            fit: BoxFit.cover,
          ),
        ),
        child: Consumer<DiseaseViewModel>(builder: (context, model, child) {
          return CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                expandedHeight: MediaQuery.of(context).size.height * 0.6,
                backgroundColor: Colors.transparent,
                foregroundColor: Colors.transparent,
                floating: false,
                pinned: false,
                snap: false,
                flexibleSpace: FlexibleSpaceBar(
                  background: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SingleChildScrollView(
                      child: Column(
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
                            model.diseaseModel.disease!,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 22.0, color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            model.diseaseModel.description!,
                            textAlign: TextAlign.justify,
                            style: const TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            model.diseaseModel.description2!,
                            textAlign: TextAlign.justify,
                            style: const TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
                  return TreatmentAccordionWidget(
                    title: model.diseaseModel.treatmentPlan![index]!.plan!,
                    content: model.diseaseModel.treatmentPlan![index]!.desc!,
                  );
                }, childCount: model.diseaseModel.treatmentPlan!.length),
              ),
            ],
          );
        }),
      ),
    );
  }
}
