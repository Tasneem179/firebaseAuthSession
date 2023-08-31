import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:testproject/dataprovider/remote/firebasehelper.dart';
import 'package:testproject/screens/home.dart';

import '../components/CustomButton.dart';
import '../components/CustomTextFormField.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Column(
            children: [
              SvgPicture.asset("assets/icons/signup.svg"),
              Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Create new account",
                        style: TextStyle(
                            color: Colors.deepPurple,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomTextFormField(
                          textController: userNameController,
                          hintText: "username",
                          errorText: " Please enter your name ",
                          icons: Icons.person),
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

                      //ToDosignUpAction
                      CustomButton(text: "Sign Up", onTapAction: signUpAction),
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

  //ToDosignUpAction



  void signUpAction() async{
    if(formKey.currentState!.validate()){
      showDialog(context: context, builder: (context)
          {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
      );
      FireBaseHelper().signUp(emailController.text.toString(), passwordController.text.toString(), userNameController.text.toString()).then((value) {
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
