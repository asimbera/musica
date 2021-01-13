import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'player_event.dart';
part 'player_state.dart';
part 'player_bloc.freezed.dart';

class PlayerBloc extends Bloc<PlayerEvent, PlayerState> {
  PlayerBloc() : super(_Initial());

  @override
  Stream<PlayerState> mapEventToState(
    PlayerEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
