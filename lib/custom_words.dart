// lib/custom_words.dart

class CustomWord {
  final String word;
  final String definition;

  CustomWord(this.word, this.definition);
}

List<CustomWord> customWords = [
  CustomWord('Flutter', 'An open-source UI SDK that I hate.'),
  CustomWord(
      'Dart', 'A programming language just like the rest of the with a VM.'),
  CustomWord('Widget', 'The most hated philoisophy of Flutter'),
];
