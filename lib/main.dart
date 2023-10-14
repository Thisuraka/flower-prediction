import 'package:flower_prediction/utils/navigation_service.dart';
import 'package:flower_prediction/viewmodels/growth_viewmodel.dart';
import 'package:flower_prediction/viewmodels/home_viewmodel.dart';
import 'package:flower_prediction/viewmodels/predict_flower_viewmodel.dart';
import 'package:flower_prediction/views/onboarding/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: ((context) => HomeViewModel()),
      ),
      ChangeNotifierProvider(
        create: ((context) => PredictFlowerViewModel()),
      ),
      ChangeNotifierProvider(
        create: ((context) => GrowthViewModel()),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: NavigationService.navigatorKey,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const SplashView(),
      builder: EasyLoading.init(),
    );
  }
}
