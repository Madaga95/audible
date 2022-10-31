import 'package:flutter/material.dart';
import '../player.dart';

class PlayerView extends StatelessWidget {
  const PlayerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_downward,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.directions_car,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Image.network(
                'https://m.media-amazon.com/images/I/51a3GQYQRbL._SL500_.jpg'),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 25),
            child: Text(
              'Prologue',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ),
          const PlayerProgress(),
          const PlayerActions(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Tab(icon: Icon(Icons.speed), text: 'Vitesse'),
                Tab(icon: Icon(Icons.list), text: 'Chapitres'),
                Tab(icon: Icon(Icons.timer_outlined), text: 'Mise en veille'),
                Tab(icon: Icon(Icons.bookmark_add_outlined), text: '+ Clip'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
