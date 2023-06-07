import 'package:brew_crew/Services/auth.dart';
import 'package:brew_crew/Widgets/Form_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  // const Register({Key? key}) : super(key: key);
  final Function toogleView;
  Register( {required this.toogleView});
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String uaerid='';
  String pass='';
  String error='';
  bool loading=false;
  final _formkey=GlobalKey<FormState>();
  AuthService _auth=AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[200],
      appBar: AppBar(
        title: Text('Sign Up to Brew Crew'),
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        actions: <Widget>[
          TextButton.icon(onPressed: (){
            widget.toogleView();
          },
            label: Text('Sign In',style: TextStyle(color: Colors.white),),
            icon: Icon(Icons.person,color: Colors.white,),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(60.0),
        child: Center(
          child: Container(
            child: Form(
              key:_formkey,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(style: TextStyle(
                    color: Colors.brown,
                  ),
                    decoration: textInputDecoration.copyWith(hintText: 'Email',
                        prefixIcon: Icon(Icons.email_outlined,color: CupertinoColors.black,)),
                    validator: (value)=> value!.isEmpty ? 'Enter the Userid': null,
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
                    decoration: textInputDecoration.copyWith(hintText: 'Password',
                        prefixIcon: Icon(Icons.password_outlined,color: Colors.black,)),
                    validator: (value)=> (6>value!.length) ? 'Enter the password +6': null,
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
                      dynamic user3=await _auth.registerwithpass(uaerid, pass);
                      if(user3==null){
                        setState(() {
                          loading=false;
                          error='Please Enter Vaild Email/Password';
                        });
                      }
                    }
                  }, child: Text('Sign Up')),
                  SizedBox(
                    height: 20,
                  ),
                  Text(error,style: TextStyle(fontSize: 25,color: Colors.red),)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
