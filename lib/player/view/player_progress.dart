import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../player.dart';

class PlayerProgress extends StatelessWidget {
  const PlayerProgress({super.key});

  @override
  Widget build(BuildContext context) {
    final position = context.select((PlayerBloc bloc) => bloc.state.position);
    final progress = 1 - (position / 300);
    final restPosition = 300 - position;

    final restMinutes =
        ((restPosition / 60) % 60).floor().toString().padLeft(2, '0');
    final restSeconds = (restPosition % 60).floor().toString().padLeft(2, '0');
    final minutesStr =
        ((position / 60) % 60).floor().toString().padLeft(2, '0');
    final secondsStr = (position % 60).floor().toString().padLeft(2, '0');
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: LinearProgressIndicator(
            backgroundColor: Colors.grey.shade400,
            color: Colors.black,
            minHeight: 2,
            value: progress,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '$minutesStr:$secondsStr',
                style: const TextStyle(fontSize: 18),
              ),
              Text(
                '12h ${minutesStr}mn restantes',
                style: const TextStyle(fontSize: 18),
              ),
              Text(
                '-$restMinutes:$restSeconds',
                style: const TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
