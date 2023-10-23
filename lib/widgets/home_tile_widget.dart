// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flower_prediction/style.dart';
import 'package:flower_prediction/utils/static/app_assets.dart';
import 'package:flutter/material.dart';

class HomeTileWidget extends StatelessWidget {
  final String asset;
  final String title;
  final Function()? onTap;
  const HomeTileWidget({
    Key? key,
    required this.asset,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          image: const DecorationImage(
            alignment: Alignment.bottomCenter,
            image: AssetImage(AppAssets.homeTile),
            fit: BoxFit.contain,
          ),
          color: greenLvl2,
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.4),
              spreadRadius: 1,
              blurRadius: 2,
              blurStyle: BlurStyle.normal,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(children: [
          Flexible(
            flex: 5,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),
          Flexible(
            flex: 15,
            child: Container(
              decoration: BoxDecoration(
                // color: Colors.blue,
                image: DecorationImage(
                  alignment: Alignment.bottomCenter,
                  image: AssetImage(asset),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
