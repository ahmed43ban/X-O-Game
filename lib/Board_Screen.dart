import 'package:flutter/material.dart';

class BoardScreen extends StatelessWidget {
  static const String routeName= "Board";
  const BoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BoardArgs args = ModalRoute.of(context)?.settings.arguments as BoardArgs;
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors:[
                Color(0xff00D2FF),
                Color(0xff3A7BD5),
              ] )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: Column(
          children: [
            Row(
              children: [
                Text(args.player1name),
                Text(args.player2name),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class BoardArgs{
  String player1name;
  String player2name;
  String selctedplayer;
  BoardArgs({required this.player1name,required this.player2name,required this.selctedplayer});
}