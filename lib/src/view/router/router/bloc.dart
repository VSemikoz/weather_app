import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import '../router_delegate.dart';
import 'router.dart';

@Singleton()
class RouterBloc extends Bloc<RouterEvent, List<RouteInfo>> {
  RouterBloc() : super([ScreenProvider.startUp()]) {
    on<ToInit>((event, emit) => toInit(event, emit));
    on<OnPop>((event, emit) => onPop(event, emit));
    on<ToMain>((event, emit) => toMain(event, emit));
  }

  List<RouteInfo> get stack => state;

  toInit(ToInit event, Emitter<List<RouteInfo>> emit) => emit([ScreenProvider.startUp()]);

  onPop(OnPop event, Emitter<List<RouteInfo>> emit) => emit(stack..removeLast());

  toMain(ToMain event, Emitter<List<RouteInfo>> emit) => emit([ScreenProvider.main()]);
}
