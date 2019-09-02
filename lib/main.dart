import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      theme: ThemeData(
        primaryColor: Colors.deepPurpleAccent
      ),
      home: RandomWords(),
    );
  }
}

class RandomWordsState extends State<RandomWords> {
  final Set<WordPair>_savedSet = new Set();
  final List<WordPair> _suggestions = new List();
  final _biggerFont = const TextStyle(fontSize: 18.0);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final value = new WordPair.random();
    return Scaffold(
      appBar: AppBar(
        title: Text("Random Name Generation"),
        centerTitle: true,
        elevation:10 ,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.arrow_forward),onPressed: onNavigate)
        ],
      ),
      body: buildSuggestions(),
    );
  }

  Widget buildSuggestions() {
    return ListView.builder(
        itemBuilder: /*1*/ (context, i) {
          if (i.isOdd) return Divider(); /*2*/

          final index = i ~/ 2; /*3*/
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10)); /*4*/
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair wordPair) {
    final bool isRecordExist = _savedSet.contains(wordPair);
    return ListTile(
      subtitle: Text("Tile"),
      title: Text(
        wordPair.asPascalCase,
        style: _biggerFont,
      ),
      leading: Icon(
        isRecordExist?Icons.favorite:Icons.favorite_border,
        color: isRecordExist?Colors.deepOrange:Colors.black12,
      ),
      onTap:() {
        setState(() {
        if(isRecordExist){
          _savedSet.remove(wordPair);
        }else{
          _savedSet.add(wordPair);
        }
        });
      });
  }

  void onNavigate() {
    Navigator.of(context).push(new MaterialPageRoute(
        builder: (BuildContext context){
         final Iterable<ListTile>items = _savedSet.map(
             (WordPair wordpair){
               return ListTile(
                title: Text(wordpair.asPascalCase,style: _biggerFont),
               );
             }
         );
         final List<Widget> dividedList = ListTile.divideTiles(context:context,tiles: items).toList();
          return Scaffold(
            appBar: AppBar(
              title: Text("Details"),
            ),
            body: ListView(children:dividedList,),
          );
        })
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    RandomWordsState state = new RandomWordsState();
    return state;
  }
}
