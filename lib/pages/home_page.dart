import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_simple/widgets.dart';
import 'package:todo_simple/pages/todo_page.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';


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
                    return InkWell(
                      onTap: (){Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context)=>Viewpage(),
                        ),
                      );
                        },
                      child: TaskCard(
                        title: document["title"]==null?"Untitled":document["title"],
                        dec: document["des"]==null?"Untitled":document["des"],
                        task: document["task"]==null?"Untitled":document["task"],
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

class Viewpage extends StatefulWidget {
  const Viewpage({Key? key,this.document}) : super(key: key);

  final Map<String,dynamic> document=null;

  @override
  State<Viewpage> createState() => _ViewpageState();


}

class _ViewpageState extends State<Viewpage> {

  TextEditingController _titleController = TextEditingController();
  TextEditingController _desController = TextEditingController();
  TextEditingController _tkController = TextEditingController();

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
              child: Icon(Icons.add),
              onTap: (){
                FirebaseFirestore.instance.collection("Todo").add(
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
              label: 'Add'
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context)=>MyHome(),
                  ),
                );
              },
              label: 'Delete'
          ),
        ],
        backgroundColor:Colors.deepOrange,
      ),
    );
  }
}
