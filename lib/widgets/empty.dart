

import 'package:flutter/material.dart';

Widget Empty(String imagepath){
  return Container(
    height: 300,
    width: 300,
    child: Image.asset(imagepath,fit: BoxFit.fill,),
  );

}