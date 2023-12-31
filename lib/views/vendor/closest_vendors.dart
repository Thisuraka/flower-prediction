import 'dart:async';

import 'package:flower_prediction/utils/static/app_assets.dart';
import 'package:flower_prediction/utils/static/app_strings.dart';
import 'package:flower_prediction/viewmodels/vendor_viewmodel.dart';
import 'package:flower_prediction/views/vendor/cost_estimate.dart';
import 'package:flower_prediction/views/vendor/route_map.dart';
import 'package:flower_prediction/widgets/custom_app_bar.dart';
import 'package:flower_prediction/widgets/vendor_expanding_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class ClosestVendors extends StatelessWidget {
  const ClosestVendors({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();

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
                  height: MediaQuery.of(context).size.height * 0.4,
                  margin: const EdgeInsets.symmetric(vertical: 30),
                  child: GoogleMap(
                    mapType: MapType.normal,
                    initialCameraPosition: CameraPosition(
                      target: LatLng(model.userLocation!.latitude, model.userLocation!.longitude),
                      zoom: 14.5,
                    ),
                    myLocationEnabled: true,
                    myLocationButtonEnabled: true,
                    markers: model.vendorMarkerList,
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.4,
                  color: const Color(0x952F2E2F),
                  child: ListView.builder(
                    itemCount: model.closestVendors.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: VendorExpandingWidget(
                          closestVendorModel: model.closestVendors[index],
                          goToDirections: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RouteMap(
                                  userLocation:
                                      LatLng(model.userLocation!.latitude, model.userLocation!.longitude),
                                  closestVendorsModel: model.closestVendors[index],
                                ),
                              ),
                            );
                          },
                          goToPriceEstimate: () {
                            model.numberOfPlantsController.clear();
                            model.plantCostModel = null;
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CostEstimate(
                                  vendorId: model.closestVendors[index].vendorId,
                                ),
                              ),
                            );
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
