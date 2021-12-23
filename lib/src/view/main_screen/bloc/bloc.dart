import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../common/logger/logger.dart';
import '../../../domain/usecases/weather.dart';
import 'main_screen.dart';

@Injectable()
class MainBloc extends Bloc<MainEvent, MainState> {
  final GetWeatherUseCase _getWeatherUseCase;

  MainBloc(this._getWeatherUseCase) : super(MainState.loading()) {
    on<MainEventInit>((event, emit) => _init(event, emit));
  }

  _init(MainEventInit event, Emitter<MainState> emit) async{
    final a = await _getWeatherUseCase();
    Log().writer.log(a.toString());
  }
}
