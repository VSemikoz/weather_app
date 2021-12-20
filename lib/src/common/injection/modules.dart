import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../data/network/client/client.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  Dio get dio => WeatherClient().create();
}
