import 'package:freezed_annotation/freezed_annotation.dart';

part 'state.freezed.dart';

@freezed
abstract class StartUpState with _$StartUpState {
  const factory StartUpState.first() = StartUpStateFirst;
  const factory StartUpState.second() = StartUpStateSecond;
  const factory StartUpState.third() =StartUpStateThird;
}
