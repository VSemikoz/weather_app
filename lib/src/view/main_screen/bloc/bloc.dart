import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_app/src/common/logger/logger.dart';
import 'package:weather_app/src/view/main_screen/bloc/event.dart';
import 'package:weather_app/src/view/main_screen/bloc/state.dart';

@Injectable()
class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(MainState.loading()) {
    on<MainEventInit>((event, emit) => _init(event, emit));
  }

  _init(MainEventInit event, Emitter<MainState> emit) {
    Log().writer.log("MainBloc");

  }
}
