import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
typedef boardBtnClick =void Function(int);
class Boardbtn extends StatelessWidget {
  String Symbol;
  boardBtnClick onclick;
  int index;
   Boardbtn({required this.Symbol,required this.onclick,required this.index});

  @override
  Widget build(BuildContext context) {
    return Expanded(child: InkWell(
      onTap: (){
        onclick(index);
      },
      child: Container(alignment: Alignment.center,
          child:Symbol.isEmpty?null
          :SvgPicture.asset(Symbol=="X"?"assets/images/X.svg":"assets/images/O.svg")),
    ));
  }
}
