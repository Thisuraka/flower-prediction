import 'dart:io';

import 'package:flower_prediction/utils/static/app_strings.dart';
import 'package:flower_prediction/widgets/rounded_textbox_widget.dart';
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

void predictFlowerPopup({
  required TextEditingController soilPhValueController,
  required TextEditingController growingTimePeriodController,
  required BuildContext context,
  required GlobalKey formKey,
  required String selectedValue,
  required Function(String?) onSelected,
  required dynamic Function() onConfirm,
}) async {
  List<String> dropdownItems = ['Colombo', 'Badulla', 'Hatton', 'Kalutara', 'Kandy', 'Mount Lavinia'];


  final List<DropdownMenuEntry<String>> locationEntries = <DropdownMenuEntry<String>>[];
  for (final String month in dropdownItems) {
    locationEntries.add(
      DropdownMenuEntry<String>(value: month, label: month.toString()),
    );
  }

  if (context.mounted) {
    showModalBottomSheet<void>(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return Form(
          key: formKey,
          child: Container(
            padding: const EdgeInsets.all(8.0),
            height: MediaQuery.of(context).size.height * 0.8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const Text(
                  AppStrings.plantPredictionEnterDetails,
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: DropdownMenu<String>(
                    width: MediaQuery.of(context).size.width - 20,
                    initialSelection: selectedValue,
                    label: const Text(
                      AppStrings.plantPredictionEnterFarmerLocation,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    textStyle: const TextStyle(
                      color: Colors.white,
                    ),
                    dropdownMenuEntries: locationEntries,
                    enableSearch: false,
                    leadingIcon: const Icon(Icons.location_on, color: greenLvl2),
                    onSelected: onSelected,
                  ),
                ),
                RoundedTextboxWidget(
                  controller: soilPhValueController,
                  labelText: AppStrings.plantPredictionEnterSoilPh,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppStrings.enterValues;
                    }
                    return null;
                  },
                ),
                RoundedTextboxWidget(
                  controller: growingTimePeriodController,
                  labelText: AppStrings.plantPredictionEnterGrowTimePeriod,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppStrings.enterValues;
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20), backgroundColor: greenLvl1),
                  onPressed: onConfirm,
                  child: const Text(
                    AppStrings.next,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
