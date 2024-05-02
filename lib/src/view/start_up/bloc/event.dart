import 'package:freezed_annotation/freezed_annotation.dart';

part 'event.freezed.dart';

@freezed
abstract class StartUpEvent with _$StartUpEvent {
  const factory StartUpEvent.toFirst() = StartUpEventToFirst;
  const factory StartUpEvent.toSecond() = StartUpEventToSecond;
  const factory StartUpEvent.toThird() = StartUpEventToThird;
  const factory StartUpEvent.requestLocation() = StartUpEventToRequestLocation;
}
