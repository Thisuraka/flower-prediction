// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flower_prediction/style.dart';
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
        width: MediaQuery.of(context).size.width / 2.5,
        height: MediaQuery.of(context).size.width / 2.5,
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          image: const DecorationImage(
            alignment: Alignment.bottomCenter,
            image: AssetImage("assets/images/home_tile.png"),
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
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Image.asset(
            asset,
            height: 110,
          )
        ]),
      ),
    );
  }
}
