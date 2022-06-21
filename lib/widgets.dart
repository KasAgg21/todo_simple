import 'package:flutter/material.dart';

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
