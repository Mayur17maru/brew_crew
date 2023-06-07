import 'package:brew_crew/Services/auth.dart';
import 'package:brew_crew/Widgets/Form_border.dart';
import 'package:brew_crew/Widgets/loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Sign_in extends StatefulWidget {
  // const Sign_in({Key? key}) : super(key: key);
  final Function toogleView;
  Sign_in({required this.toogleView()});
  @override
  State<Sign_in> createState() => _Sign_inState();
}

class _Sign_inState extends State<Sign_in> {
  final AuthService _auth=AuthService();
  @override
  String uaerid='';
  String pass='';
  String error='';
  bool loading=false;
  final _formkey=GlobalKey<FormState>();
  Widget build(BuildContext context) {
    return loading?Loading():Scaffold(
      backgroundColor: Colors.brown[200],
      appBar: AppBar(
        title: Text('Sign in to Brew Crew'),
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        actions: <Widget>[
          TextButton.icon(onPressed: (){
            widget.toogleView();
          },
            label: Text('Register',style: TextStyle(color: Colors.white),),
            icon: Icon(Icons.person,color: Colors.white,),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(60.0),
        child: Center(
          child: Container(
            child: Form(
              key: _formkey,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration:textInputDecoration.copyWith(hintText: 'Email',
                        prefixIcon: Icon(Icons.email_outlined,color: Colors.black,)),
                    style: TextStyle(
                    color: Colors.brown,
                  ),
                    onChanged: (value) {
                      setState(() {
                        uaerid=value;
                      });
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(style: TextStyle(
                      color: Colors.brown,
                  ),
                    decoration: textInputDecoration.copyWith(hintText: 'Password',prefixIcon: Icon(Icons.password_outlined,color: Colors.black,)),
                    onChanged: (value) {
                      setState(() {
                        pass=value;
                      });
                    },
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(style:ElevatedButton.styleFrom(primary: Colors.pinkAccent),onPressed: () async {
                    if(_formkey.currentState!.validate()){
                      setState(() {
                        loading=true;
                      });
                      dynamic result=await _auth.signinwithpass(uaerid, pass);
                      if(result==null){
                        setState(() {
                          loading=false;
                          error='Enter Valid Email/Password';
                        });
                      }
                    }
                  }, child: Text('Sign in'))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
