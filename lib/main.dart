import 'package:cosmetic_skin_app/models/product_data.dart';
import 'package:cosmetic_skin_app/view/adding_form_product_screen.dart';
import 'package:cosmetic_skin_app/view/product_details_screen.dart';
import 'package:cosmetic_skin_app/view/products_overview_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

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
        ? ChangeNotifierProvider(
        create: (context) => ProductData(),
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: ProductsOverviewScreen(),
            routes: {
              ProductsOverviewScreen.routeName: (context) => ProductsOverviewScreen(),
              ProductDetailsScreen.routeName: (context) => ProductDetailsScreen(),
            }))
        : CupertinoApp();
  }
}
