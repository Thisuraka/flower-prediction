import 'package:flower_prediction/style.dart';
import 'package:flower_prediction/utils/navigation_service.dart';
import 'package:flutter/material.dart';

Future<void> dataPopup(String text) {
  return showDialog<void>(
    context: NavigationService.navigatorKey.currentContext!,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        elevation: 0.0,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        alignment: Alignment.center,
        child: SizedBox(
          height: MediaQuery.of(context).size.height / 6,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.cancel,
                    color: greenLvl1,
                    size: 30,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ]),
        ),
      );
    },
  );
}
