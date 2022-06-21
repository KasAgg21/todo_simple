import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_simple/widgets.dart';

class Todopage extends StatefulWidget {

  @override
  State<Todopage> createState() => _TodopageState();
}

class _TodopageState extends State<Todopage> {
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
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: Container(
                      padding: EdgeInsets.only(
                        top: 20,
                        left: 10,
                        right: 10,
                        bottom: 10,
                      ),
                      child: TextField(
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: InputDecoration(
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          hintText: "Enter ToDo List Title",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          filled: true,
                          fillColor: Colors.white10,
                        ),

                      ),
                    ),
                )
              ],
            ),
            TextField(
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
              decoration: InputDecoration(
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 12,
                ),
                hintText: "Enter Description of the ToDo List",
                border: InputBorder.none,
                filled: false,
                fillColor: Colors.white10,
              ),

            ),
            ToDoList(),
          ],
        ),
      ),
    );
  }
}
