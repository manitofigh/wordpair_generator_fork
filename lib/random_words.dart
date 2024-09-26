import 'package:flutter/material.dart';
import 'custom_words.dart';

class RandomWords extends StatefulWidget {
  const RandomWords({super.key});

  @override
  RandomWordsState createState() => RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final _savedWords = <CustomWord>{};

  Widget _buildList() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: customWords.length * 2,
      itemBuilder: (context, item) {
        if (item.isOdd) return const Divider();
        final index = item ~/ 2;
        return _buildRow(customWords[index]);
      },
    );
  }

  Widget _buildRow(CustomWord word) {
    final alreadySaved = _savedWords.contains(word);

    return ListTile(
      title: Text(
        word.word,
        style: const TextStyle(fontSize: 18),
      ),
      trailing: Icon(
        alreadySaved ? Icons.double_arrow : Icons.arrow_right,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _savedWords.remove(word);
          } else {
            _savedWords.add(word);
          }
        });
      },
      onLongPress: () {
        if (word == customWords.first) {
          _pushDefinition(word);
        }
      },
    );
  }

  void _pushSaved() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      final Iterable<ListTile> tiles = _savedWords.map((CustomWord word) {
        return ListTile(
            title: Text(
          word.word,
          style: const TextStyle(fontSize: 16.0),
        ));
      });

      final List<Widget> divided =
          ListTile.divideTiles(context: context, tiles: tiles).toList();
      return Scaffold(
        appBar: AppBar(title: const Text('Saved Words')),
        body: ListView(
          children: divided,
        ),
      );
    }));
  }

  void _pushDefinition(CustomWord word) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return Scaffold(
        appBar: AppBar(title: Text(word.word)),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            word.definition,
            style: const TextStyle(fontSize: 18.0),
          ),
        ),
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Word List'),
        actions: <Widget>[
          IconButton(onPressed: _pushSaved, icon: const Icon(Icons.list))
        ],
      ),
      body: _buildList(),
    );
  }
}
