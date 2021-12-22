import 'package:freezed_annotation/freezed_annotation.dart';

part 'event.freezed.dart';

@freezed
abstract class MainEvent with _$MainEvent{
  const factory MainEvent.init() = MainEventInit;

}
