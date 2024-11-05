import 'package:flutter/material.dart';
import 'package:game_challenge/games/screen/tic_tac_toe_screen.dart';
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
        children: [
          GameCard(
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => TicTacToeScreen()),
              // );
            },
            title: 'Trivia',
            imagePath: 'assets/trivia.jpg',
            description:
                "Think you know it all? Put your knowledge to the test with this interactive trivia game! Choose the right answer from a set of tricky options. From history to pop culture, each round is packed with brain-teasing questions. Best of all, you can load up new questions in a snap with JSON or your own database!",
          ),
          GameCard(
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => TicTacToeScreen()),
              // );
            },
            title: 'Flood Frenzy',
            imagePath: 'assets/flood.png',
            description:
                "Get ready to dive into a flood of color! Start at the top left and spread your way across the board, flooding it with a single hue. Each click brings you closer to conquering the grid—but you’ll need strategy to win. It’s simple, addictive, and oddly satisfying!",
          ),
          GameCard(
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => TicTacToeScreen()),
              // );
            },
            title: 'Repeat After Me',
            imagePath: 'assets/repeatafterme.jpg',
            description:
                "Challenge your memory with this sequence game! Watch closely and then try to mimic the pattern. Each round, the sequence gets longer and more challenging. Can you keep up, or will you lose your rhythm? Test your memory and quick reflexes in this fun game that’s easy to start but hard to master!",
          ),
          GameCard(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TicTacToeScreen()),
              );
            },
            title: 'Tic Tac Toe',
            imagePath: 'assets/tictactoe.png',
            description:
                "The ultimate showdown of X’s and O’s! In this classic game, place your pieces and aim for three in a row to win. Perfect for friendly competition and quick matches, Tic Tac Toe is just as fun now as it’s always been. Strategy, simplicity, and a chance to outsmart your friends!",
          ),
          GameCard(
            onTap: () {},
            title: 'Tower of Hanoi',
            imagePath: 'assets/tower.png',
            description:
                "Challenge yourself with this age-old puzzle! Move your tower of disks one by one across pegs, aiming to reconstruct the pyramid on the final peg. But there’s a catch: only one disk can move at a time, and no big disks on top of small ones. It’s the ultimate test of patience and problem-solving!",
          ),
        ],
      ),
    );
  }
}
