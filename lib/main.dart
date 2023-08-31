import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:testproject/screens/LogIn.dart';
import 'package:testproject/screens/home.dart';

void main() async{
  //ToDoIntializeFibase
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp();
  runApp(const MyApp());
}

//ToDoStartWidget
Widget start()
{
  if(FirebaseAuth.instance.currentUser!=null)
    {
      return Home();
    }
  else
    return LogIn();
}



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      debugShowCheckedModeBanner: false,
      home: start(),
    );
  }
}

