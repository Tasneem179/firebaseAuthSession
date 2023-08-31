import 'package:flutter/material.dart';
import 'package:testproject/screens/LogIn.dart';
import '../dataprovider/remote/firebasehelper.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page",style: TextStyle(color: Colors.white),),
        actions: [
          IconButton(onPressed: () async{
            //To DO SignOut
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>LogIn()));
          await FireBaseHelper().signOut();

          }, icon: Icon( Icons.logout))
        ],
      backgroundColor: Colors.deepPurple,),
      body: Center(child: Text("Welcome To Home Page")),
    );
    
  }
}
