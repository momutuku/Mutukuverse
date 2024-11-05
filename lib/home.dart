import 'package:flutter/material.dart';
import 'package:game_challenge/widgets/GameCard.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Game Collection'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16.0),
        childAspectRatio: 0.8,
        children: const [
          GameCard(
            title: 'Trivia',
            imagePath: 'assets/trivia.jpg',
            description: "Triviaaa",
          ),
          GameCard(
            title: 'Flood',
            imagePath: 'assets/flood.png',
            description: "Flood",
          ),
          GameCard(
            title: 'Repeat After Me',
            imagePath: 'assets/repeatafterme.jpg',
            description: "Repeat After me",
          ),
          GameCard(
            title: 'Tic Tac Toe',
            imagePath: 'assets/tictactoe.png',
            description: "Tic Tac Toe",
          ),
          GameCard(
            title: 'Tower of Hanoi',
            imagePath: 'assets/tower.png',
            description: "Tower of Hanoi",
          ),
        ],
      ),
    );
  }
}
