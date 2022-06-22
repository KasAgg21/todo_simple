import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_simple/widgets.dart';
import 'package:todo_simple/pages/todo_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {

  final Stream<QuerySnapshot> stream =
  FirebaseFirestore.instance.collection("Todo").snapshots();

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
              child :StreamBuilder(
                stream: stream,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if(!snapshot.hasData){
                    return Center(child: CircularProgressIndicator());
                  }
                  return ListView.builder(
                      itemCount: snapshot.data.docs.length ,
                      itemBuilder: (context, index){
                        Map<String,dynamic> document=
                        snapshot.data.docs[index].data() as Map<String, dynamic>;
                    return TaskCard(
                      title: document["title"]==null?"Untitled":document["title"],
                      dec: document["des"]==null?"Untitled":document["des"],
                    );
                  }
                  );
                }
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