import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:xogame/Board_Screen.dart';
import 'package:xogame/CustomTextField.dart';

class HomeScreen extends StatefulWidget {
  static const routName = "home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController player1controller=TextEditingController();

  TextEditingController player2controller=TextEditingController();

  String selctedplayer="X";
  @override
  void initState() {
    super.initState();
    player1controller.addListener((){
      setState(() {

      });
    });
    player2controller.addListener((){
      setState(() {

      });
    });

  }

  @override
  Widget build(BuildContext context) {
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
        body: Column(
          children: [
            Expanded(
              child: Stack(alignment: Alignment.center,
                children: [
                  Image.asset("assets/images/Frame 1.png",width: double.infinity,fit: BoxFit.cover,),
                  Text("Tix-Tac-Toe",style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.w900
                  ),)
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Customtextfield(Player: "player 1 name",controller: player1controller,),
                  SizedBox(height: 15,),
                  Customtextfield(Player: "player 2 name",controller: player2controller,),
                  SizedBox(height: 17,),
                  Text("Pick who goes first?",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 24,color: Colors.white),),
                  SizedBox(height: 17,),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(onTap: (){
                        setState(() {
                          selctedplayer="X";
                        });
                      },
                        child: Container(padding: EdgeInsets.all(30),
                            decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32),
                          color:selctedplayer=="X"? Colors.white:Colors.transparent
                        ),
                            child: SvgPicture.asset("assets/images/X.svg")),
                      ),
                      InkWell(onTap: (){
                        setState(() {
                          selctedplayer="O";
                        });
                      },
                        child: Container(padding: EdgeInsets.all(30),
                            decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32),
                          color: selctedplayer=="O"? Colors.white:Colors.transparent
                        ),
                            child: SvgPicture.asset("assets/images/O.svg")),
                      ),


                    ],
                  ),
                  SizedBox(height: 17,),
                  Visibility(
                    visible: player1controller.text.isNotEmpty&&player2controller.text.isNotEmpty,
                    child: ElevatedButton(onPressed:(){
                      Navigator.pushReplacementNamed(context, BoardScreen.routeName,
                          arguments:BoardArgs(player1name: player1controller.text,
                              player2name: player2controller.text,
                              selctedplayer: selctedplayer) );
                    } ,
                        child:Text("Start Game") ),
                  )

                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
