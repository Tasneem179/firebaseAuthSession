import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:testproject/dataprovider/remote/firebasehelper.dart';
import 'package:testproject/screens/home.dart';
import 'package:testproject/screens/signUp.dart';

import '../components/CustomButton.dart';
import '../components/CustomTextFormField.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Column(
            children: [
              SvgPicture.asset(
                "assets/icons/login.svg",
              ),
              Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Welcome back ",
                        style: TextStyle(
                            color: Colors.deepPurple,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      CustomTextFormField(
                          textController: emailController,
                          hintText: "email",
                          errorText: " Please enter your email ",
                          icons: Icons.mail),
                      CustomTextFormField(
                          textController: passwordController,
                          hintText: "password",
                          errorText: " Please enter your password ",
                          icons: Icons.lock),

                      //////ToDosignInAction
                      CustomButton(text: "Log In", onTapAction: signInAction),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account?",
                            style: TextStyle(fontSize: 18),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => SignUp()));
                              },
                              child: Text('SingUp',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.deepPurple)))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  //ToDosignInAction

  void signInAction() async{
    if(formKey.currentState!.validate()){
      showDialog(context: context, builder: (context)
      {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      );
      FireBaseHelper().signIN(emailController.text.toString(), passwordController.text.toString()).then((value) {
        if(value is User)
        {
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Home()));
        }
        else if (value is String)
        {
          Navigator.of(context).pop();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value)));
        }


      });



    }

  }
}
