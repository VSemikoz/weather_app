import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/usecases/weather.dart';
import 'main_screen.dart';

@Injectable()
class MainBloc extends Bloc<MainEvent, MainState> {
  final GetWeatherUseCase _getWeatherUseCase;

  MainBloc(this._getWeatherUseCase) : super(MainState.loading()) {
    on<MainEventInit>((event, emit) => _init(event, emit));
  }

  _init(MainEventInit event, Emitter<MainState> emit) async {
    emit(MainState.loading());
    final result = await _getWeatherUseCase();
    result.fold(
      (weatherData) => emit(MainState.success(weatherData)),
      (exception) => emit(MainState.failure()),
    );
  }
}
