import 'dart:io';

import 'package:flower_prediction/widgets/rounded_textbox_widget.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:flower_prediction/style.dart';
import 'package:flower_prediction/widgets/common_button_widget.dart';

void imageViewPopup({XFile? imageFile, required BuildContext context, dynamic Function()? onTap}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        elevation: 0.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Container(
          height: MediaQuery.of(context).size.height / 2.5,
          padding: const EdgeInsets.all(10.0),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.white,
          ),
          child: Column(children: [
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
              width: MediaQuery.of(context).size.width / 2,
              height: MediaQuery.of(context).size.width / 2,
              margin: const EdgeInsets.all(5),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.file(File(imageFile!.path)),
              ),
            ),
            CommonButtonWidget(
              text: "Continue",
              size: MediaQuery.of(context).size.width / 1.3,
              onTap: onTap,
            ),
          ]),
        ),
      );
    },
  );
}

void growthImageViewPopup({
  XFile? imageFile,
  required BuildContext context,
  required TextEditingController controller,
  dynamic Function()? onTap,
}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        elevation: 0.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Container(
          height: MediaQuery.of(context).size.height / 2.0,
          padding: const EdgeInsets.all(10.0),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.white,
          ),
          child: Column(children: [
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
              width: MediaQuery.of(context).size.width / 2,
              height: MediaQuery.of(context).size.width / 2,
              margin: const EdgeInsets.all(5),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.file(File(imageFile!.path)),
              ),
            ),
            RoundedTextboxWidget(
              controller: controller,
              labelText: 'Months (#)',
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
            ),
            CommonButtonWidget(
              text: "Continue",
              size: MediaQuery.of(context).size.width / 1.3,
              onTap: onTap,
            ),
          ]),
        ),
      );
    },
  );
}
