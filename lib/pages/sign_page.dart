import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:todo_simple/pages/home_page.dart';

class Signuppage extends StatefulWidget {
  const Signuppage({Key? key}) : super(key: key);

  @override
  State<Signuppage> createState() => _SignuppageState();
}

class _SignuppageState extends State<Signuppage> {

  firebase_auth.FirebaseAuth firebaseAuth = firebase_auth.FirebaseAuth.instance;
  TextEditingController _emailController= TextEditingController();
  TextEditingController _passController= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(
                top: 60,
              ),
            ),
            Center(
                child:
                Text("Sign Up",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: GoogleFonts.lato().fontFamily,
              fontSize: 40,
              color: Colors.white
                  )
                )
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 20
              ),
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: "Email",
                  labelStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  hintText: "Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.white10,
                ),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  top: 0,
                  left: 10,
                  right: 10,
                  bottom: 20
              ),
              child: TextField(
                controller: _passController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  labelStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  hintText: "Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.white10,
                ),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ElevatedButton(
               style: ButtonStyle(
                 backgroundColor: MaterialStateProperty.all(Colors.deepOrange),
                 padding: MaterialStateProperty.all(EdgeInsets.only(
                   top: 13,
                   right: 145,
                   left: 145,
                   bottom: 13
                 ))
               ),
                onPressed: ()async{
                try {
                  firebase_auth.UserCredential userCredential = await firebaseAuth.createUserWithEmailAndPassword(
                       email: _emailController.text, password: _passController.text);
                  print(userCredential.user?.email);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context)=>MyHome(),
                    ),
                  );
                } catch (e) {
                  final snackbar = SnackBar(content: Text(e.toString()));
                  ScaffoldMessenger.of(context).showSnackBar(snackbar);
                }
                },
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    fontFamily: GoogleFonts.lato().fontFamily,
                  ),
                ),

            )
          ],
        ),
      ),
    );
  }
}
