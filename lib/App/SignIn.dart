import 'dart:convert';
import 'package:figma_app/App/ForgotPassword.dart';

import 'Home.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'SignUp.dart';

class LoginSignUp extends StatefulWidget {
  const LoginSignUp({super.key});

  @override
  State<LoginSignUp> createState() => _LoginSignUpState();
}

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class _LoginSignUpState extends State<LoginSignUp> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isChecked = false;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Container(
                    width: screenWidth,
                    height: 120,
                    color: Colors.greenAccent,
                    child: Row(
                      children: [
                        Container(
                          child: Image.asset('assets/images/Group 3.png'),
                          padding: EdgeInsets.fromLTRB(30, 20, 0, 0),
                        ),
                        Container(
                          child: Image.asset('assets/images/Vector 6.png'),
                          alignment: Alignment.bottomRight,
                          padding: EdgeInsets.fromLTRB(130, 0, 20, 20),
                        ),
                        Container(
                          child: Image.asset('assets/images/Vector.png'),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Sign In',
                      style:
                          TextStyle(fontSize: 34, fontWeight: FontWeight.w700),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Welcome back, Guys',
                      style: TextStyle(fontSize: 24, color: Colors.green),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Email',
                    // suffixIcon: Icon(Icons.email),
                    border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  labelText: 'Password',
                  // suffixIcon: Icon(Icons.password),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ForgorPassword()))
                    },
                    child: Container(
                      child: Text('Forgot Password'),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  login(emailController.text.toString(),
                      passwordController.text.toString());
                },
                child: Container(
                  height: 60,
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text(
                      "Sign In",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Center(
                child: Text('or sign in with'),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    child: Image(
                      image: AssetImage('assets/images/Group 9.png'),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)),
                  ),
                  Container(
                    width: 40,
                    margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    height: 40,
                    child: Image(
                      image: AssetImage('assets/images/Group 8.png'),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)),
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    child: Image(
                      image: AssetImage('assets/images/Group 10.png'),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)),
                  ),
                ],
              )),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text(
                      'Don’t have an account?',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignUp()))
                    },
                    child: Container(
                      child: Text(
                        'Sign Up',
                        style:
                            TextStyle(color: Colors.greenAccent, fontSize: 14),
                      ),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    width: 135,
                    height: 5,
                    color: Colors.black,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> login(String email, String password) async {
    try {
      Response response =
          await post(Uri.parse('https://dummyjson.com/auth/login'),
              // Uri.parse('http://192.168.1.18:5000/api/user/login'),
              body: {
            'username': email,
            'password': password,
          });
      if (email.isEmpty || password.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            "Missing input",
          ),
          backgroundColor: Colors.red,
        ));
      } else if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data);
        // var data1 = jsonEncode(data);
        // print(data1);
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Login success")));
        print('Response body: ${response.body}');
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Home()));
      } else if (response.statusCode == 404) {
        print('Not found');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Invalid Credential"),
          backgroundColor: Colors.red,
        ));
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
