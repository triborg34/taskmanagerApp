import 'package:flutter/material.dart';

Widget fab(Function() onPress, String lable, String heroTag, IconData iconsD) {
  return Container(
    child: FloatingActionButton.extended(
      backgroundColor: Color.fromARGB(255, 49, 118, 52),
      onPressed: onPress,
      label: Text(lable),
      heroTag: heroTag,
      icon: Icon(iconsD),
    ),
  );
}
