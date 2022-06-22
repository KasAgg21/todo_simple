import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_simple/pages/view_paga.dart';
import 'package:todo_simple/widgets.dart';
import 'package:todo_simple/pages/todo_page.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {


  final Stream<QuerySnapshot> stream =
  FirebaseFirestore.instance.collection("users").doc(firebase_auth.FirebaseAuth.instance.currentUser!.uid).collection("Todo").snapshots();

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
              child :StreamBuilder<QuerySnapshot>(
                stream: stream,
                  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if(!snapshot.hasData){
                    return Center(child: CircularProgressIndicator());
                  }
                  return ListView.builder(
                      itemCount: snapshot.data?.docs.length ,
                      itemBuilder: (context, index){
                        Map<String,dynamic> document=
                        snapshot.data?.docs[index].data() as Map<String, dynamic>;
                    return InkWell(
                      onTap: (){Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context)=>Viewpage(
                              title: snapshot.data?.docs[index]['title'],
                              des:snapshot.data?.docs[index]['des'],
                            task: snapshot.data?.docs[index]['task'],
                            id: snapshot.data!.docs[index].reference.id.toString(),
                          ),
                        ),
                      );
                        },
                      child: TaskCard(
                        title: document["title"]==null?"Untitled":document["title"],
                        dec: document["des"]==null?"Untitled":document["des"],
                        task: document["task"]==null?"Untitled":document["task"],
                        id: snapshot.data!.docs[index].reference.id.toString(),
                      ),
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


