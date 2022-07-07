import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:tiraqu/constant.dart';
import 'package:tiraqu/routes/route.dart';

// void main() {
//   runApp(const MyApp());
//   configLoading();
// }

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('id_ID', null)
      .then((_) => runApp(const MyApp()));
  configLoading();
}

void configLoading() {
  EasyLoading.instance
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorType = EasyLoadingIndicatorType.chasingDots
    ..maskType = EasyLoadingMaskType.none
    ..indicatorColor = kLightPrimaryColor
    ..textColor = Colors.black
    ..backgroundColor = Colors.white
    ..maskColor = Colors.transparent;
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TiraQu',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: RouterGenerator.generateRoute,
      builder: EasyLoading.init(),
    );
  }
}
