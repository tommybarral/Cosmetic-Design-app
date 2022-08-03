import 'package:cosmetic_skin_app/view/products_overview_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final setPlatform = Theme.of(context).platform;
    final androidPlatform = (setPlatform == TargetPlatform.android);
    return (androidPlatform)
        ? MaterialApp(debugShowCheckedModeBanner: false, home: ProductsOverviewScreen(),)
        : CupertinoApp();
  }
}
