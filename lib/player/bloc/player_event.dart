import 'package:equatable/equatable.dart';

class PlayerEvent extends Equatable {
  const PlayerEvent();

  @override
  List<Object> get props => [];
}

class PlayerStarted extends PlayerEvent {
  const PlayerStarted({required this.position});

  final int position;
}

class PlayerPaused extends PlayerEvent {
  const PlayerPaused();
}

class PlayerResumed extends PlayerEvent {
  const PlayerResumed();
}

// permet de recommencer à zéro
class PlayerReset extends PlayerEvent {
  const PlayerReset();
}

// permet de reculer de 30sec
class PlayerReplay30 extends PlayerEvent {
  const PlayerReplay30();
}

// permet d'avancer de 30sec
class PlayerFoward30 extends PlayerEvent {
  const PlayerFoward30();
}

class PlayerTicked extends PlayerEvent {
  const PlayerTicked({required this.position});

  final int position;

  @override
  List<Object> get props => [];
}
