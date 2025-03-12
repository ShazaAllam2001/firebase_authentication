import 'package:firebase_authentication/pages/shopping_page.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State <SignUp> createState() =>  SignUpState();
}

class  SignUpState extends State<SignUp> {
  bool hiddenPassword1 = true;
  bool hiddenPassword2 = true;

  togglePassword1() {
    hiddenPassword1 = !hiddenPassword1;
    setState(() {

    });
  }

  togglePassword2() {
    hiddenPassword2 = !hiddenPassword2;
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passController = TextEditingController();
    TextEditingController confPassController = TextEditingController();

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
                  controller: nameController,
                  validator: (value) {
                    if (value == null) {
                      return "Full Name is required";
                    }
                    else if(value[0] != value[0].toUpperCase()) {
                      return "First Character of Full Name should be Capital";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "Full Name",
                  )
                ),
              ),
        
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
                  obscureText: hiddenPassword1,
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
                      onPressed: togglePassword1, 
                      icon: Icon(hiddenPassword1? Icons.visibility_off : Icons.visibility),
                    )
                  )
                ),    
              ),
              
        
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextFormField(
                  controller: confPassController,
                  obscureText: hiddenPassword2,
                  validator: (value) {
                    if (value == null) {
                      return "Confirm Password is required";
                    }
                    else if (passController.text != value) {
                      return "Passwords should be identical";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "Confrim Password",
                    suffixIcon: IconButton(
                      onPressed: togglePassword2, 
                      icon: Icon(hiddenPassword2? Icons.visibility_off : Icons.visibility),
                    )
                  )
                ),
              ),
        
              SizedBox(height: 30),
        
              ElevatedButton(
                onPressed: () {
                  debugPrint(nameController.text);
                  debugPrint(emailController.text);
                  debugPrint(passController.text);
                  debugPrint(confPassController.text);
        
                  if (formKey.currentState!.validate()) {
                    loginDialog();
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
                child: const Text("Sign Up"),
              )
            ],
          ),
        ),
      )
    ); 
  }

  Future<void> loginDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Login'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Account created successfully.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ShoppingPage())
                );
              },
            ),
          ],
        );
      },
    );
  }
}