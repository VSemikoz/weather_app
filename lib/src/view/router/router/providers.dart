import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/injection/injection.dart';
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
}
