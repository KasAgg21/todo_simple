import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_simple/widgets.dart';
import 'package:todo_simple/pages/todo_page.dart';

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
        automaticallyImplyLeading: false,
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              TaskCard(
                title: "Get Started",
                dec: "Click on the +  icon to add a new ToDo list.",
              ),
              TaskCard(),
              TaskCard(),
              TaskCard(),
              TaskCard(),
              TaskCard(),
              TaskCard(),
              TaskCard(),
            ],
        ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context)=>Todopage(),
              ),
          );
        },
        child: Icon(CupertinoIcons.add,
          size: 30,
        ),
        backgroundColor:Colors.deepOrange,
      ),
    );
  }
}