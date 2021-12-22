import 'package:flutter/material.dart';
import 'package:weather_app/src/common/logger/logger.dart';

class MainScreen extends StatelessWidget {
  static const id = "/main";

  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Log().writer.log("MainScreen");
    return Scaffold(body: Container());
  }
}
