import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

final GoogleSignIn googleSignIn = GoogleSignIn();


class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}
logout(){
  googleSignIn.signOut();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return RaisedButton( 
      child: Text('Logout'),
      onPressed: logout,
    );
  }
}
