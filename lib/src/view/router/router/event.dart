import 'package:freezed_annotation/freezed_annotation.dart';

part 'event.freezed.dart';

@freezed
abstract class RouterEvent with _$RouterEvent {
  const factory RouterEvent.onPop() = OnPop;
  const factory RouterEvent.toInit() = ToInit;
  const factory RouterEvent.toMain() = ToMain;
}
