import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';

import 'event.dart';
import 'state.dart';

class StartUpBloc extends Bloc<StartUpEvent, StartUpState> {
  StartUpBloc() : super(StartUpState.first()) {
    on<StartUpEventToFirst>((event, emit) => toFirst(event, emit));
    on<StartUpEventToSecond>((event, emit) => toSecond(event, emit));
    on<StartUpEventToThird>((event, emit) => toThird(event, emit));
    on<StartUpEventToRequestLocation>((event, emit) => toRequestLocation(event, emit));
  }

  toFirst(StartUpEventToFirst event, Emitter<StartUpState> emit) => emit(StartUpState.first());

  toSecond(StartUpEventToSecond event, Emitter<StartUpState> emit) => emit(StartUpState.second());

  toThird(StartUpEventToThird event, Emitter<StartUpState> emit) {
    emit(StartUpState.third());
  }

  toRequestLocation(StartUpEventToRequestLocation event, Emitter<StartUpState> emit) async {
    //TODO check curr perm, if allow not request
    //TODO check location service
    final status = await Permission.location.request();
    if (status.isGranted) add(StartUpEventToThird());
  }
}
