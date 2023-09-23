import 'package:flower_prediction/widgets/common_button_widget.dart';
import 'package:flower_prediction/widgets/header_widget.dart';
import 'package:flutter/material.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            const HeaderWidget(
              text: "Welcome to \nSea cense",
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 5,
            ),
            CommonButtonWidget(
              text: "Sign in",
              size: MediaQuery.of(context).size.width / 1.3,
              onTap: () {},
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 25,
            ),
            CommonButtonWidget(
              text: "Sign up",
              size: MediaQuery.of(context).size.width / 1.3,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
