import 'package:flutter/material.dart';

import 'package:english_words/english_words.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget{


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: "ddd",
      home: RandomWords(),
      theme: ThemeData(
        primaryColor: Colors.white
      ),
    );
  }

}

class RandomWords extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RandomWordsState();
  }
}

class RandomWordsState extends State<RandomWords>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // final wordPair = WordPair.random();
    // return Text(wordPair.asPascalCase);

    return Scaffold(appBar: AppBar(
      title: Text('Startup Name Generator'),
      actions: <Widget>[
        IconButton(icon: Icon(Icons.list),onPressed: _pushSaved,)
      ],
    ),
    body: _buildSuggestions(),);
  }

  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18);
  final _saved = Set<WordPair>();
  Widget _buildSuggestions(){
    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemBuilder: (context, i){
        print('$i');
        if (i.isOdd) return Divider(color: Colors.pink,);
        final index = i ~/ 2;
        print('i==>$i,index==>$index,suggestionslength==>${_suggestions.length}');
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      },
    );
  }

  Widget _buildRow(WordPair pair){
    final alreadySaved = _saved.contains(pair);
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: Icon(alreadySaved ? Icons.favorite : Icons.favorite_border,color: alreadySaved ? Colors.red : null,),
      onTap: (){
        setState((){
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        }); 
      },
    );
  }

  void _pushSaved(){
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context){
          final tiles = _saved.map(
            (pair){
              return ListTile(
                title: Text(pair.asPascalCase,style: _biggerFont,),
              );
            }
          );
          final divided = ListTile.divideTiles(
            context: context,
            tiles: tiles,
            color: Colors.pink
          ).toList();
          return Scaffold(
            appBar: AppBar(title: Text('Saved Suggestions'),),
            body: ListView(children: divided,),
          );
        }
      )
    );
  }
}