import 'package:flutter/material.dart';
import 'package:game_challenge/GameDetailPage.dart';

class GameCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final String description;
  final Function() onTap;

  const GameCard({
    super.key,
    required this.title,
    required this.imagePath,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => GameDetailPage(
              title: title,
              imagePath: imagePath,
              description: description,
              onTap: () {
                onTap();
              },
            ),
          ),
        );
      },
      child: Card(
        elevation: 4.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
