import 'package:equatable/equatable.dart';

class PlayerState extends Equatable {
  const PlayerState(this.position);

  final int position;

  @override
  List<Object> get props => [position];
}

class PlayerInitial extends PlayerState {
  PlayerInitial(int position) : super(position);

  @override
  String toString() => 'PlayerInitial{ position: $position}';
}

class PlayerInPause extends PlayerState {
  const PlayerInPause(int position) : super(position);

  @override
  String toString() => 'PlayerInPause { position: $position}';
}

class PlayerInProgress extends PlayerState {
  const PlayerInProgress(int position) : super(position);

  @override
  String toString() => 'PlayerInProgress { position: $position}';
}

class PlayerComplete extends PlayerState {
  const PlayerComplete() : super(0);
}
