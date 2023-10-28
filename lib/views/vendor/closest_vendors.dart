import 'package:flower_prediction/utils/static/app_assets.dart';
import 'package:flower_prediction/utils/static/app_strings.dart';
import 'package:flower_prediction/viewmodels/vendor_viewmodel.dart';
import 'package:flower_prediction/widgets/custom_app_bar.dart';
import 'package:flower_prediction/widgets/vendor_expanding_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ClosestVendors extends StatelessWidget {
  const ClosestVendors({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(35.0),
          child: CustomAppBar(
            title: AppStrings.plantVendorTitle,
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
        child: Center(
          child: Consumer<VendorViewModel>(builder: (context, model, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.3,
                  margin: const EdgeInsets.symmetric(vertical: 30),
                  color: Colors.amber,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.5,
                  color: const Color(0x952F2E2F),
                  child: ListView.builder(
                    itemCount: model.closestVendors.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: VendorExpandingWidget(
                          closestVendorModel: model.closestVendors[index],
                          goToDirections: () {
                            // TODO Sandaru
                            // model.closestVendors[index].lat
                            // model.closestVendors[index].lon
                          },
                        ),
                      );
                    },
                  ),
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}
