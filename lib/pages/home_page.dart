import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_simple/widgets.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      appBar: AppBar(
        toolbarHeight: 70,

        centerTitle: true,
        title: Text(
          "ToDo Maker",
          textAlign: TextAlign.center,
          textScaleFactor: 1.5,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
          backgroundColor: Colors.deepOrange,
      ),
      body: Container(
        margin: EdgeInsets.only(
          top: 10,
        ),
        child: Column(
          children: [
            TaskCard(
              title: "Get Started",
              dec: "Click on the +  icon to add a new ToDo list.",
            ),
            TaskCard(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(IconlyLight.plus,
          size: 30,
        ),
        backgroundColor:Colors.deepOrange,
      ),
    );
  }
}