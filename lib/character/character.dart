
import 'package:flutter/material.dart';

class Character {
  final String name;
  final int level;
  final int health;
  final int mana;

  Character({
    required this.name,
    required this.level,
    required this.health,
    required this.mana,
  });
}


class CharacterCard extends StatelessWidget {
  const CharacterCard({Key? key, required this.character}) : super(key: key);

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text('Name - ${character.name}'),
          Text('Level - ${character.level.toString()}'),
          Text(character.level.toString()),
          Text(character.health.toString()),
          Text(character.mana.toString()),
        ],
      ),
    );
  }
}