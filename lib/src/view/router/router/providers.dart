import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/injection/injection.dart';
import '../../screen.dart';
import '../../bloc.dart';
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
          create: (context) => getIt<MainBloc>()..add(MainEvent.init()),
          child: const MainScreen(),
        ),
      );
}
