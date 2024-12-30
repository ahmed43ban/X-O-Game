import 'dart:async';

import 'package:flutter/material.dart';
import 'package:xogame/BoardBtn.dart';

class BoardScreen extends StatefulWidget {
  static const String routeName= "Board";

  @override
  State<BoardScreen> createState() => _BoardScreenState();
}

class _BoardScreenState extends State<BoardScreen> {
  late String selctedplayer;
  List<String>boardState=[
    "","","",
    "","","",
    "","","",
  ];
  int player1score = 0;
  int player2score = 0;
  String massage ="Player 1’s Turn";
  @override
  Widget build(BuildContext context) {
    BoardArgs args = ModalRoute.of(context)?.settings.arguments as BoardArgs;
    selctedplayer = args.selctedplayer;
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
          toolbarHeight: 15,
        ),
        body: Padding(
          padding:  EdgeInsets.all(16),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(44)
                ),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text("${args.player1name} (${args.selctedplayer})",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w600),),
                        Text(player1score.toString(),style: TextStyle(fontSize: 25,fontWeight: FontWeight.w600))
                      ],
                    ),
                    Column(
                      children: [
                        Text("${args.player2name} (${args.selctedplayer=="X"?"O":"X"})",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w600)),
                        Text(player2score.toString(),style: TextStyle(fontSize: 25,fontWeight: FontWeight.w600))
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32,),
              Text(massage,style: TextStyle(fontWeight: FontWeight.w700,fontSize: 36,color: Colors.white),),
              SizedBox(height: 24,),
              Expanded(child: Container(padding: EdgeInsets.symmetric(horizontal: 13,vertical: 22),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(44)
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Boardbtn(Symbol: boardState[0],onclick: onboardclick,index: 0,),
                          VerticalDivider(color: Colors.black,width: 0,),
                          Boardbtn(Symbol: boardState[1],onclick: onboardclick,index: 1),
                          VerticalDivider(color: Colors.black,width: 0,),
                          Boardbtn(Symbol: boardState[2],onclick: onboardclick,index: 2),
                        ],
                      ),
                    ),
                    Divider(color: Colors.black,height: 0,),
                    Expanded(
                      child: Row(
                        children: [
                          Boardbtn(Symbol: boardState[3],onclick: onboardclick,index: 3),
                          VerticalDivider(color: Colors.black,width: 0,),
                          Boardbtn(Symbol: boardState[4],onclick: onboardclick,index: 4),
                          VerticalDivider(color: Colors.black,width: 0,),
                          Boardbtn(Symbol: boardState[5],onclick: onboardclick,index: 5),
                        ],
                      ),
                    ),
                    Divider(color: Colors.black,height: 0,),
                    Expanded(
                      child: Row(
                        children: [
                          Boardbtn(Symbol: boardState[6],onclick: onboardclick,index: 6),
                          VerticalDivider(color: Colors.black,width: 0,),
                          Boardbtn(Symbol: boardState[7],onclick: onboardclick,index: 7),
                          VerticalDivider(color: Colors.black,width: 0,),
                          Boardbtn(Symbol: boardState[8],onclick: onboardclick,index: 8),
                        ],
                      ),
                    ),


                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
  int cont = 1;
  onboardclick(int index,){
    if(boardState[index].isEmpty){
      setState(() {
        if (cont.isOdd){
          boardState[index]=selctedplayer;
          if(checkwinner(selctedplayer)){
            player1score+=10;
            massage = "Player 1’s Win";
            resetgame();
            return;
          }
          massage = "Player 2’s Turn";
        }else{
          boardState[index]=selctedplayer=="X"?"O":"X";
          if(checkwinner(selctedplayer=="X"?"O":"X")){
            player2score+=10;
            massage = "Player 2’s Win";
            resetgame();
            return;
          }
          massage = "Player 1’s Turn";
        }
        if(cont==9){
          massage="Draw";
          resetgame();
        }
        cont++;
      });
    }
  }
 bool checkwinner(symbol){
    for(int i =0 ; i<=6;i+=3){
      if(boardState[i]==symbol&& boardState[i+1]==symbol&&boardState[i+2]==symbol){
        return true;
      }
    }
    for(int i =0 ; i<=2;i++){
      if(boardState[i]==symbol&& boardState[i+3]==symbol&&boardState[i+6]==symbol){
        return true;
      }
    }
    if(boardState[0]==symbol&& boardState[4]==symbol&&boardState[8]==symbol){
      return true;
    }
    if(boardState[2]==symbol&& boardState[4]==symbol&&boardState[6]==symbol){
      return true;
    }
    return false;
  }
  resetgame(){
    Timer(Duration(seconds: 2),
        (){
          boardState=[
            "","","",
            "","","",
            "","","",
          ];
          cont=1;
          massage="Player 1’s Turn";
          setState(() {

          });
        });
  }

}

class BoardArgs{
  String player1name;
  String player2name;
  String selctedplayer;
  BoardArgs({required this.player1name,required this.player2name,required this.selctedplayer});
}