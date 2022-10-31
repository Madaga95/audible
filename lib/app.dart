import 'package:flutter/material.dart';
import 'player/player.dart';

class PlayerApp extends StatelessWidget {
  const PlayerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Player App',
      home: PlayerPage(),
    );
  }
}
