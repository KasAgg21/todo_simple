import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:todo_simple/pages/home_page.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_simple/pages/sign_page.dart';
import 'package:todo_simple/pages/signin_page.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  firebase_auth.FirebaseAuth firebaseAuth = firebase_auth.FirebaseAuth.instance;

  void signup() async{
    try{
      await firebaseAuth.createUserWithEmailAndPassword(email: "aggkas21@gmail.com",
          password: "12345");}
    catch(e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme: GoogleFonts.latoTextTheme(
              Theme.of(context).textTheme
          )
      ),
      home: Signinpage(),
      //home: MyHome(),
    );
  }
}