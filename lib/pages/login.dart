import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication/pages/shopping_page.dart';
import 'package:firebase_authentication/pages/sign_up.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State <Login> createState() =>  LoginState();
}

class  LoginState extends State<Login> {
  bool hiddenPassword = true;

  togglePassword() {
    hiddenPassword = !hiddenPassword;
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passController = TextEditingController();

    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextFormField(
                  controller: emailController,
                  validator: (value) {
                    if (value == null) {
                      return "Email is required";
                    }
                    else if(!value.contains("@")) {
                      return "Enter a valid Email Address";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "Email",
                  )
                ),
              ),
        
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextFormField(
                  controller: passController,
                  obscureText: hiddenPassword,
                  validator: (value) {
                    if (value == null) {
                      return "Password is required";
                    }
                    else if (value.length < 6) {
                      return "Password should be at least 6 characters";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "Password",
                    suffixIcon: IconButton(
                      onPressed: togglePassword, 
                      icon: Icon(hiddenPassword? Icons.visibility_off : Icons.visibility),
                    )
                  )
                ),    
              ),
        
              SizedBox(height: 30),
        
              ElevatedButton(
                onPressed: () async {
                  debugPrint(emailController.text);
                  debugPrint(passController.text);
        
                  if (formKey.currentState!.validate()) {
                    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: emailController.text, 
                      password: passController.text
                    );

                    if (credential.user != null) {
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ShoppingPage())
                      );
                    }
                    else {
                      SnackBar snackBar = SnackBar(
                        content: Text("Email or Password are not correct"),
                        duration: Duration(seconds: 2),
                        action: SnackBarAction(
                          label: "ok",
                          onPressed: () {},
                        ),
                      );
          
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  }
                  else {
                    SnackBar snackBar = SnackBar(
                      content: Text("Error in input fields"),
                      duration: Duration(seconds: 2),
                      action: SnackBarAction(
                        label: "ok",
                        onPressed: () {},
                      ),
                    );
        
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                }, 
                child: const Text("Log in"),
              ),

              SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't Have an account?  "),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignUp())
                      );
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.purple)
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      )
    ); 
  }
}