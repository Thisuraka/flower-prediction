import 'package:flower_prediction/style.dart';
import 'package:flower_prediction/utils/static/app_assets.dart';
import 'package:flower_prediction/utils/static/app_strings.dart';
import 'package:flower_prediction/viewmodels/vendor_viewmodel.dart';
import 'package:flower_prediction/widgets/custom_app_bar.dart';
import 'package:flower_prediction/widgets/popups/data_popup.dart';
import 'package:flower_prediction/widgets/rounded_textbox_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CostEstimate extends StatelessWidget {
  final int vendorId;
  const CostEstimate({super.key, required this.vendorId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(35.0),
          child: CustomAppBar(
            title: '',
            removeBg: true,
          )),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppAssets.homeBg),
              fit: BoxFit.cover,
            ),
            color: Colors.transparent),
        child: SingleChildScrollView(
          child: Center(
            child: Consumer<VendorViewModel>(builder: (context, model, child) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(105, 64, 63, 63),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: RoundedTextboxWidget(
                            controller: model.numberOfPlantsController,
                            labelText: AppStrings.plantVendorEnterNumberOfPlants,
                            keyboardType: const TextInputType.numberWithOptions(decimal: false),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return AppStrings.enterValues;
                              }
                              return null;
                            },
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              textStyle: const TextStyle(fontSize: 20), backgroundColor: greenLvl1),
                          child: const Text(
                            AppStrings.plantVendorGetEstimate,
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            model.costCalculation(vendorId);
                          },
                        ),
                      ],
                    ),
                  ),
                  model.plantCostModel != null
                      ? Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.6,
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(105, 64, 63, 63),
                              borderRadius: BorderRadius.all(Radius.circular(20))),
                          child: Column(
                            children: [
                              itemRow(AppStrings.plantVendorCostPerPlant,
                                  model.plantCostModel!.costPerPlant.toString(), context),
                              itemRow(AppStrings.plantVendorFertilizerPerUnit,
                                  model.plantCostModel!.fertilizerPerUnit.toString(), context),
                              itemRow(AppStrings.plantVendorFlowersPerPlant,
                                  model.plantCostModel!.flowersPerPlant.toString(), context),
                              itemRow(AppStrings.plantVendorSinglePlantCost,
                                  model.plantCostModel!.singlePlantCost.toString(), context),
                              itemRow(AppStrings.plantVendorTotalCost,
                                  model.plantCostModel!.totalCost.toString(), context),
                              itemRow(AppStrings.plantVendorTotalNoOfFlowers,
                                  model.plantCostModel!.totalNoOfFlowers.toString(), context),
                              itemRow(AppStrings.plantVendorTravelCost,
                                  model.plantCostModel!.travelCost.toString(), context),
                            ],
                          ),
                        )
                      : Container(),
                  if (model.plantCostModel != null)
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 20), backgroundColor: greenLvl1),
                      child: const Text(
                        AppStrings.plantVendorPlaceOrder,
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        dataPopup(AppStrings.plantVendorOrderPlaced);
                      },
                    ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}

itemRow(String text, String? desc, BuildContext context) {
  return Visibility(
    visible: !(desc == "" || desc == null),
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: const TextStyle(fontSize: 14, decoration: TextDecoration.underline),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
            child: Text(
              desc!,
              textAlign: TextAlign.justify,
              style: const TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ],
      ),
    ),
  );
}
