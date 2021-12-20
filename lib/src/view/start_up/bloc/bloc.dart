import 'package:flutter_bloc/flutter_bloc.dart';

import 'event.dart';
import 'state.dart';

class StartUpBloc extends Bloc<StartUpEvent, StartUpState> {
  StartUpBloc() : super(StartUpState.first()) {
    on<StartUpEventToFirst>((event, emit) => toFirst(emit));
    on<StartUpEventToSecond>((event, emit) => toSecond(emit));
    on<StartUpEventtoThird>((event, emit) => toThird(emit));
  }

  toSecond(Emitter<StartUpState> emit) => emit(StartUpState.second());

  toThird(Emitter<StartUpState> emit) => emit(StartUpState.third());

  toFirst(Emitter<StartUpState> emit) => emit(StartUpState.first());
}
