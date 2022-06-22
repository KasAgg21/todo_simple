import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:todo_simple/pages/home_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_simple/pages/todo_page.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

class Viewpage extends StatefulWidget {

  final String title,des,task,id;

  Viewpage({required this.title,required this.des,required this.task,required this.id});

  @override
  State<Viewpage> createState() {
    return _ViewpageState();
  }
}

class _ViewpageState extends State<Viewpage> {

  late TextEditingController _titleController;
  late TextEditingController _desController;
  late TextEditingController _tkController;

  @override
  void initState(){
    super.initState();
    _titleController = TextEditingController(text: widget.title);
    _desController = TextEditingController(text: widget.des);
    _tkController = TextEditingController(text: widget.task);
  }


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
                      controller: _titleController,
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
              keyboardType: TextInputType.multiline,
              maxLines: null,
              controller: _desController,
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
            Padding(
              padding: EdgeInsets.only(
                top: 6,
                left: 12,
                right: 10,
                bottom: 10,
              ),
              child: TextField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                controller: _tkController,
                style: TextStyle(
                    fontSize: 17,
                    color: Colors.white
                ),
                decoration: InputDecoration(
                  hintStyle: TextStyle(
                      color: Colors.grey
                  ),
                  hintText: "Enter the Task",
                  border: InputBorder.none,
                  filled: false,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        overlayColor: Colors.black,
        overlayOpacity: 0.4,
        children: [
          SpeedDialChild(
            child: Icon(Icons.edit,color: Colors.white,),
              label: 'Save Edit',
              backgroundColor: Colors.green,
            onTap: (){
              FirebaseFirestore.instance.collection("users").doc(firebase_auth.FirebaseAuth.instance.currentUser!.uid).collection("Todo").doc(widget.id).update(
                  {
                    "title":_titleController.text,
                    "task":_tkController.text,
                    "des":_desController.text,
                  }
              );
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context)=>MyHome(),
                ),
              );
            },
          ),
          SpeedDialChild(
              child: Icon(Icons.add),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context)=>Todopage(),
                  ),
                );
              },
              label: 'New List'
          ),
          SpeedDialChild(
              child: Icon(Icons.home,color: Colors.white,),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context)=>MyHome(),
                  ),
                );
              },
              label: 'Home',
              backgroundColor: Colors.deepOrange
          ),SpeedDialChild(
              child: Icon(Icons.delete,color: Colors.white,),
              backgroundColor: Colors.pink,
              onTap: (){
                FirebaseFirestore.instance.collection("users").doc(firebase_auth.FirebaseAuth.instance.currentUser!.uid).collection("Todo").doc(widget.id).delete().then((value) {
                  Navigator.pop(context);
                });
              },
              label: 'Delete'
          ),
        ],
        backgroundColor:Colors.deepOrange,
      ),
    );
  }
}