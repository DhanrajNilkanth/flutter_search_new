import 'package:flutter/material.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Demo(),
    );
  }
}

class Demo extends StatefulWidget {
  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {

  SearchBar searchBar;

  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();


  AppBar buildAppBar(BuildContext context){
    return AppBar(
      title: Text('Search Bar Demo'),
      actions: [searchBar.getSearchAction(context)],
    );
  }

  void onSubmitted(String value){
    setState(() {
      return _globalKey.currentState.showSnackBar(SnackBar(
          content: Text('$value!'),
      ));
    });
  }

  _DemoState(){
    searchBar = SearchBar(
        setState: setState,
        buildDefaultAppBar:buildAppBar,
      inBar: false,
      onSubmitted: onSubmitted,
      onClosed: (){
          print('Closed!');
      },
      onCleared: (){
          print('Cleared1');
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: searchBar.build(context),
      key: _globalKey,
      body: Center(
        child: Container(
          height: 200,
          width: 250,
          color: Colors.blue.shade200,
          child: Center(
            child: Text('Demo Search Bar App'),
          ),
        ),
      ),
    );
  }
}














