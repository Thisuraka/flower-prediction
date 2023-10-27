import 'package:flower_prediction/style.dart';
import 'package:flower_prediction/utils/static/app_assets.dart';
import 'package:flower_prediction/utils/static/app_strings.dart';
import 'package:flower_prediction/viewmodels/vendor_viewmodel.dart';
import 'package:flower_prediction/widgets/custom_app_bar.dart';
import 'package:flower_prediction/widgets/rounded_textbox_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MatchVendor extends StatelessWidget {
  const MatchVendor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(35.0),
          child: CustomAppBar(
            title: "",
            removeBg: true,
          )),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.only(top: 50),
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppAssets.homeBg),
              fit: BoxFit.cover,
            ),
            color: Colors.transparent),
        child: Center(
          child: Consumer<VendorViewModel>(builder: (context, model, child) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: RoundedTextboxWidget(
                    controller: model.selectedVendor,
                    labelText: AppStrings.plantPredictionEnterGrowTimePeriod,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppStrings.enterValues;
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20), backgroundColor: greenLvl1),
                  onPressed: () {},
                  child: const Text(
                    AppStrings.next,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
