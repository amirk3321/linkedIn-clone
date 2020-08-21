

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

Widget navBarWebButton ({SizingInformation sizingInformation,String iconImage,String name,bool isSelectedButton}){
  return Container(
    height: 50,
    decoration: BoxDecoration(
      border: Border(bottom: BorderSide(color: isSelectedButton ==true?Colors.white:Colors.transparent,width: 2))
    ),
    margin: EdgeInsets.symmetric(horizontal: sizingInformation.localWidgetSize.width * 0.01),
    child: Column(
      children: [
        Container(
          width: 30,
          height: 30,
          child: Image.asset(iconImage,color: Colors.white,),
        ),
        Text(name,style: TextStyle(fontSize: 12,color: Colors.white),)
      ],
    ),
  );
}