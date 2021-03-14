import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Home.dart';
import 'SplashScreen.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
    title: "Minhas Viagens",
    home: SplashScreen(),
    debugShowCheckedModeBanner: false,
  ));
}
