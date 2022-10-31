import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'player_observer.dart';
import 'app.dart';

void main() {
  BlocOverrides.runZoned(
    () => runApp(const PlayerApp()),
    blocObserver: PlayerObserver(),
  );
}
