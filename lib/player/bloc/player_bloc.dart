import 'package:bloc/bloc.dart';
import 'package:audioplayers/audioplayers.dart' as audio;
import '../player.dart';
import '../../ticker.dart';
import 'dart:async';

class PlayerBloc extends Bloc<PlayerEvent, PlayerState> {
  final Ticker _ticker;
  final audioUrl =
      'https://samples.audible.fr/bk/fabp/000001/bk_fabp_000001_sample.mp3';
  final audio.AudioPlayer player = audio.AudioPlayer();

  static const int audioDuration = 300;
  StreamSubscription<int>? _tickerSubscription;

  PlayerBloc({required Ticker ticker})
      : _ticker = ticker,
        super(PlayerInitial(audioDuration)) {
    on<PlayerStarted>(_onStarted);
    on<PlayerPaused>(_onPaused);
    on<PlayerResumed>(_onResumed);
    on<PlayerFoward30>(_onFoward30);
    on<PlayerReplay30>(_onReplay30);
    on<PlayerReset>(_onReset);
    on<PlayerTicked>(_onTicked);
  }

  @override
  Future<void> close() {
    _tickerSubscription?.cancel();
    return super.close();
  }

  void _onStarted(PlayerStarted event, Emitter<PlayerState> emit) {
    emit(PlayerInProgress(event.position));
    _tickerSubscription?.cancel();
    _tickerSubscription =
        _ticker.tick(ticks: event.position).listen((position) {
      add(PlayerTicked(position: position));
      player.play(audio.UrlSource(audioUrl));
    });
  }

  void _onPaused(PlayerPaused event, Emitter<PlayerState> emit) {
    if (state is PlayerInProgress) {
      player.pause();
      _tickerSubscription?.pause();
      emit(PlayerInPause(state.position));
    }
  }

  void _onResumed(PlayerResumed resueme, Emitter<PlayerState> emit) {
    if (state is PlayerInPause) {
      player.resume();
      _tickerSubscription?.resume();
      emit(PlayerInProgress(state.position));
    }
  }

  void _onFoward30(PlayerFoward30 event, Emitter<PlayerState> emit) {
    final newposition = state.position - 30;
    _tickerSubscription?.cancel();
    _tickerSubscription = _ticker.tick(ticks: newposition).listen((position) {
      add(PlayerTicked(position: position));
      player.seek(Duration(seconds: newposition));
    });
  }

  void _onReplay30(PlayerReplay30 event, Emitter<PlayerState> emit) {
    final newposition = state.position + 30;
    _tickerSubscription?.cancel();
    _tickerSubscription = _ticker.tick(ticks: newposition).listen((position) {
      add(PlayerTicked(position: position));
      player.seek(Duration(seconds: newposition));
    });
  }

  void _onReset(PlayerReset event, Emitter<PlayerState> emit) {
    player.stop();
    _tickerSubscription?.cancel();
    emit(PlayerInitial(audioDuration));
  }

  void _onTicked(PlayerTicked event, Emitter<PlayerState> emit) {
    emit(event.position > 0
        ? PlayerInProgress(event.position)
        : const PlayerComplete());
  }
}
