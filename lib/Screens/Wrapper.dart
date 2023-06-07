import 'package:brew_crew/Model/User.dart';
import 'package:brew_crew/Screens/HOME/Home.dart';
import 'package:brew_crew/Screens/authenticate/authentication.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  // const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user2=Provider.of<user1?>(context);
    if(user2==null){
      return Authenticate();//home or auth
    }
    else{
      return Home();
    }
  }
}
