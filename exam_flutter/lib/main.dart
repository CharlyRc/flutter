// On met entre accolades tout ce qui est nommer (paramètre) via 2 points
import 'package:flutter/material.dart';
import "app.dart";
import 'bo/cart.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context)=>Cart(),
    child:MyApp(),
  ));
}