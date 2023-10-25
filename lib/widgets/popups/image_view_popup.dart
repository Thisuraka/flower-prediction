import 'dart:io';

import 'package:flower_prediction/utils/static/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:flower_prediction/style.dart';
import 'package:flower_prediction/widgets/common_button_widget.dart';

void imageViewPopup(
    {String? title,
    String? desc,
    XFile? imageFile,
    required BuildContext context,
    dynamic Function()? onTap}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        elevation: 0.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.5,
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
            const SizedBox(
              height: 10,
            ),
            Text(
              title ?? "",
              style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              desc ?? "",
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w300),
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
            const SizedBox(
              height: 20,
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
  String? title,
  String? desc,
  XFile? imageFile,
  required BuildContext context,
  Function(String?)? onSelected,
  dynamic Function()? onTap,
}) async {
  List<String> dropdownItems = ['1', '2', '3', '4', '5', '6+'];
  String selectedValue = '1';

  final List<DropdownMenuEntry<String>> monthEntries = <DropdownMenuEntry<String>>[];
  for (final String month in dropdownItems) {
    monthEntries.add(
      DropdownMenuEntry<String>(value: month, label: month.toString()),
    );
  }

  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        elevation: 0.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.6,
          padding: const EdgeInsets.all(10.0),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Color(0xFFE2E2E2),
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
            const SizedBox(
              height: 10,
            ),
            Text(
              title ?? "",
              style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              desc ?? "",
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w300),
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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: DropdownMenu<String>(
                initialSelection: selectedValue,
                label: const Text(
                  AppStrings.monthsOld,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                textStyle: const TextStyle(
                  color: Colors.black,
                ),
                dropdownMenuEntries: monthEntries,
                enableSearch: false,
                leadingIcon: const Icon(Icons.calendar_month, color: greenLvl2),
                onSelected: onSelected,
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
