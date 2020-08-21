
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:linkedin_clone/screen/widgets/style/theme.dart';

class SingleNavBarButton extends StatelessWidget {
  final IconData icon;
  final String name;
  final bool selectedButton;

  SingleNavBarButton({@required this.icon,@required this.name, this.selectedButton=false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 28,
          width: 28,
          child: Icon(icon,color: selectedButton?blueColor:Colors.black87,),
        ),
        Text(name,style: TextStyle(fontSize: 14,color: selectedButton?blueColor:Colors.black87,),)
      ],
    );
  }
}
