import 'package:flower_prediction/utils/static/app_assets.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shadowColor: Theme.of(context).colorScheme.shadow,
      scrolledUnderElevation: 20.0,
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      flexibleSpace: Container(
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
      ),
      title: Text(
        title,
        style: const TextStyle(fontSize: 20.0, color: Colors.white),
      ),
      actions: const <Widget>[],
    );
  }
}
