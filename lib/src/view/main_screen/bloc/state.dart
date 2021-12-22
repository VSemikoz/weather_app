import 'package:freezed_annotation/freezed_annotation.dart';

part 'state.freezed.dart';

@freezed
abstract class MainState with _$MainState {
  const factory MainState.loading() = MainStateLoading;

  const factory MainState.success() = MainStateSucces;

  const factory MainState.failure() = MainStateFailure;
}
