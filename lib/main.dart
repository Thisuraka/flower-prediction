import 'package:flower_prediction/style.dart';
import 'package:flower_prediction/utils/navigation_service.dart';
import 'package:flower_prediction/viewmodels/disease_viewmodel.dart';
import 'package:flower_prediction/viewmodels/growth_viewmodel.dart';
import 'package:flower_prediction/viewmodels/home_viewmodel.dart';
import 'package:flower_prediction/viewmodels/predict_flower_viewmodel.dart';
import 'package:flower_prediction/viewmodels/vendor_viewmodel.dart';
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
        create: ((context) => DiseaseViewModel()),
      ),
      ChangeNotifierProvider(
        create: ((context) => GrowthViewModel()),
      ),
      ChangeNotifierProvider(
        create: ((context) => VendorViewModel()),
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
        fontFamily: 'Nunito',
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: greenLvl1,
          brightness: Brightness.dark,
        ),
      ),
      home: const SplashView(),
      builder: EasyLoading.init(),
    );
  }
}
