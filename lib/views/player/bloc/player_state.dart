part of 'player_bloc.dart';

@freezed
abstract class PlayerState with _$PlayerState {
  const factory PlayerState.initial() = _Initial;
}
