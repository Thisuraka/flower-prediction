import 'dart:async';

import 'package:flower_prediction/models/closest_vendors.dart';
import 'package:flower_prediction/utils/google_api_key.dart';
import 'package:flower_prediction/utils/static/app_strings.dart';
import 'package:flower_prediction/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:location/location.dart';

class RouteMap extends StatefulWidget {
  final LatLng userLocation;
  final ClosestVendorsModel closestVendorsModel;
  const RouteMap({super.key, required this.userLocation, required this.closestVendorsModel});

  @override
  State<RouteMap> createState() => _RouteMapState();
}

class _RouteMapState extends State<RouteMap> {
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();

  Set<Marker> markers = {};
  Map<PolylineId, Polyline> polylines = {};

  @override
  void initState() {
    markers.add(Marker(
      markerId: MarkerId(widget.closestVendorsModel.vendorId.toString()),
      position: LatLng(widget.closestVendorsModel.lon, widget.closestVendorsModel.lat),
      infoWindow: InfoWindow(
        title: widget.closestVendorsModel.avgRating.toString(),
      ),
      icon: BitmapDescriptor.defaultMarker,
    ));
    _generatePolyLines();
    super.initState();
  }

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
        margin: const EdgeInsets.only(top: 20),
        child: GoogleMap(
          markers: markers,
          mapType: MapType.normal,
          polylines: Set<Polyline>.of(polylines.values),
          initialCameraPosition: CameraPosition(
            target: LatLng(widget.userLocation.latitude, widget.userLocation.longitude),
            zoom: 14.5,
          ),
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
      ),
    );
  }

  void _generatePolyLines() async {
    PolylinePoints polylinePoints = PolylinePoints();

    List<LatLng> polylineCoordinates = [];

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleAPiKey,
      PointLatLng(widget.userLocation.latitude, widget.userLocation.longitude),
      PointLatLng(widget.closestVendorsModel.lon, widget.closestVendorsModel.lat),
      travelMode: TravelMode.driving,
    );

    if (result.points.isNotEmpty) {
      for (var point in result.points) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      }
    } else {}
    _addPolyLine(polylineCoordinates);
  }

  void _addPolyLine(List<LatLng> polylineCoordinates) {
    PolylineId id = const PolylineId("poly");
    Polyline polyline = Polyline(
      polylineId: id,
      color: const Color(0xFF074375),
      points: polylineCoordinates,
      width: 8,
    );
    polylines[id] = polyline;
    setState(() {});
  }
}
