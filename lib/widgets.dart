import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:todo_simple/pages/todo_page.dart' as todo_pg;

class TaskCard extends StatelessWidget {

  final String? title;
  final String? dec;
  final String? task;
  TaskCard({this.title,this.dec,this.task});



  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white10,
      ),
        padding: EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 10),
        margin: EdgeInsets.only(
          bottom: 7,
          top: 10,
          left: 10,
          right: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Container(
            padding: EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 20),
            width: double.infinity,
          ),
            Container(
              child: Text(
                title ??
                "Untitled",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20),
              width: double.infinity,
            ),
            Container(
              child: Text(
                dec??
                " No Description",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20),
              width: double.infinity,
            ),
            Container(
              child: Row(
                children: [
                  Icon(IconlyBold.tick_square,
                  color: Colors.white,),
                  Container(
                  padding:EdgeInsets.only(
                      right:10 ),
                  ),
                  Text(
                    task??
                        " No Description",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
    );
  }
}

/*class ToDoList extends StatelessWidget {
  final bool? isDone;
  ToDoList({@required this.isDone});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 10,
        left: 12,
        right: 10,
        bottom: 10,
      ),
            child: TextField(
              controller: todo_pg.,
              style: TextStyle(
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
    );
  }
}*/
