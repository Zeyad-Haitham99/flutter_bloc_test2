import 'package:flutter/material.dart';
import 'package:flutter_bloc_test2/approute.dart';

void main() {
  runApp( MyApp(appRoute: AppRoute(),));
}

class MyApp extends StatelessWidget {
  final AppRoute appRoute;
  const MyApp({Key? key,required this.appRoute}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, onGenerateRoute:appRoute.generateRoute);
  }
}
