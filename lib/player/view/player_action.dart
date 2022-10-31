import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../player.dart';

class PlayerActions extends StatelessWidget {
  const PlayerActions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayerBloc, PlayerState>(
      buildWhen: (prev, state) => prev.runtimeType != state.runtimeType,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                iconSize: 40.0,
                onPressed: () {
                  context.read<PlayerBloc>().add(const PlayerReset());
                },
                icon: const Icon(
                  Icons.skip_previous,
                  color: Colors.black,
                ),
              ),
              IconButton(
                iconSize: 40.0,
                onPressed: () {
                  context.read<PlayerBloc>().add(const PlayerReplay30());
                },
                icon: const Icon(
                  Icons.replay_30,
                  color: Colors.black,
                ),
              ),
              if (state is PlayerInitial) ...[
                IconButton(
                  iconSize: 100.0,
                  onPressed: () {
                    context
                        .read<PlayerBloc>()
                        .add(PlayerStarted(position: state.position));
                  },
                  icon: const Icon(
                    Icons.play_circle_rounded,
                    color: Colors.black,
                  ),
                ),
              ],
              if (state is PlayerInProgress) ...[
                IconButton(
                  iconSize: 100.0,
                  onPressed: () {
                    context.read<PlayerBloc>().add(const PlayerPaused());
                  },
                  icon: const Icon(
                    Icons.pause_circle_outline_rounded,
                    color: Colors.black,
                  ),
                ),
              ],
              if (state is PlayerInPause) ...[
                IconButton(
                  iconSize: 100.0,
                  onPressed: () {
                    context.read<PlayerBloc>().add(const PlayerResumed());
                  },
                  icon: const Icon(
                    Icons.play_circle_rounded,
                    color: Colors.black,
                  ),
                ),
              ],
              IconButton(
                iconSize: 40.0,
                onPressed: () {
                  context.read<PlayerBloc>().add(const PlayerFoward30());
                },
                icon: const Icon(
                  Icons.forward_30,
                  color: Colors.black,
                ),
              ),
              IconButton(
                iconSize: 40.0,
                onPressed: () {
                  context.read<PlayerBloc>().add(const PlayerReset());
                },
                icon: const Icon(
                  Icons.skip_next,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
