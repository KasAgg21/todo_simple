import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class TaskCard extends StatelessWidget {

  final String? title;
  final String? dec;
  TaskCard({this.title,this.dec});



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
            )
          ],
        ),
    );
  }
}

class ToDoList extends StatelessWidget {
  const ToDoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(
              left: 12,
              top: 10,
              right: 12,
            ),
            child: Icon(
              IconlyBold.tick_square,
              color: Colors.white,
              size: 30,
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              top: 8
            ),
            child: Text(
              "Hi",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
