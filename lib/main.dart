import 'package:flutter/material.dart';
import 'package:swipe_cards/swipe_cards.dart';
import 'package:flutter_tinder/constants.dart';
import 'package:flutter_tinder/alterFunctions.dart';
import 'package:flutter_tinder/appBar.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.light),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<SwipeItem> _swipeItems = <SwipeItem>[];
  MatchEngine? _matchEngine;
  List<String> names = [
    'Sharad',
    'Samyurta',
    'Anjana',
    'Nilisha',
  ];

  get images => null;
  @override
  void initState() {
    for (int i = names.length - 1; i > 0; i--) {
      _swipeItems.add(SwipeItem(
          content: Content(text: names[i]),
          likeAction: () {
            actions(context, names[i], 'Present');
          },
          nopeAction: () {
            actions(context, names[i], 'Absent');
          },
          superlikeAction: () {
            actions(context, names[i], 'Very Attentive');
          }));
    }
    _matchEngine = MatchEngine(swipeItems: _swipeItems);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 70),
            Expanded(
                child: Container(
              child: SwipeCards(
                matchEngine: _matchEngine!,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    alignment: Alignment.bottomLeft,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(pictures[index]),
                            fit: BoxFit.cover),
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10)),
                    padding: EdgeInsets.all(20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          names[index],
                          style: TextStyle(
                              fontSize: 32,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  );
                },
                onStackFinished: () {
                  return ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('The List is over')));
                },
              ),
            )),
          ],
        ),
      ),
    );
  }
}

class Content {
  final String? text;
  Content({this.text});
}
