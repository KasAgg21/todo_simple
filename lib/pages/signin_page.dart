import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_simple/pages/home_page.dart';
import 'package:todo_simple/pages/sign_page.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

class Signinpage extends StatefulWidget {
  const Signinpage({Key? key}) : super(key: key);

  @override
  State<Signinpage> createState() => _SigninpageState();
}

class _SigninpageState extends State<Signinpage> {

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
                Text("Login",
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
                      right: 150,
                      left: 150,
                      bottom: 13
                  ))
              ),

              onPressed: ()async{
                try {
                  firebase_auth.UserCredential userCredential = await firebaseAuth.signInWithEmailAndPassword(
                      email: _emailController.text, password: _passController.text);
                  final String uid = firebaseAuth.currentUser!.uid;
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
                "Login",
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                  fontFamily: GoogleFonts.lato().fontFamily,
                ),
              ),

            ),
            Padding (padding: EdgeInsets.only(
              top: 20,
              left: 80,
              bottom: 10,
            ),
              child: Row(
                children: [
                  Text(
                    "If don't have an Account? ",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: GoogleFonts.lato().fontFamily,
                      color: Colors.white,
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context)=>Signuppage(),
                        ),
                      );
                    },
                    child: Text(
                        "Sign Up",
                      
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: GoogleFonts.lato().fontFamily,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        decorationThickness: 2,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
