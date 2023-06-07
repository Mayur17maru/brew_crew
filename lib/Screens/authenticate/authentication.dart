import 'package:brew_crew/Screens/authenticate/register.dart';
import 'package:brew_crew/Screens/sign_in.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignin=true;
  void toogleView(){
    setState(() => showSignin= !showSignin
    );
  }
  @override
  Widget build(BuildContext context) {
    if(showSignin){
      return Sign_in(toogleView: toogleView);
    }
    else{
      return Register(toogleView: toogleView);
    };

  }
}
