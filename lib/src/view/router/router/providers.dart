import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/injection/injection.dart';
import '../../main_screen/bloc/bloc.dart';
import '../../main_screen/screen/main_screen.dart';
import '../../start_up/bloc/bloc.dart';
import '../../start_up/screen/start_up.dart';
import '../router_delegate.dart';

class ScreenProvider {
  static RouteInfo startUp() => RouteInfo(
        id: StartUpScreen.id,
        builder: (_) => BlocProvider(
          create: (context) => getIt<StartUpBloc>(),
          child: const StartUpScreen(),
        ),
      );

  static RouteInfo main() => RouteInfo(
        id: MainScreen.id,
        builder: (_) => BlocProvider(
          create: (context) => getIt<MainBloc>(),
          child: const MainScreen(),
        ),
      );
}
