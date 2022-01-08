import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Color setColor(String category) {
  Color color;

  switch (category) {
    case 'Personal':
      color = Colors.blue;
      break;
    case 'Amigos':
      color = Colors.green;
      break;
    case 'Trabajo':
      color = Colors.purple;
      break;
    case 'Mandados':
      color = Colors.orange;
      break;
    case 'Sin lista':
      color = Colors.grey;
      break;
    default:
      color = Colors.grey;
  }

  return color;
}
