import 'dart:convert';
import 'Home.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'SignIn.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController firstnameController = TextEditingController();
TextEditingController lastnameController = TextEditingController();

bool isChecked = false;

class _SignUpState extends State<SignUp> {
  @override
  // List<String> _selectedOptions = [];
  // void _showMutiSelection () async{
  //   final List<String> items = [
  //     'Traveler',
  //     'Guide'
  //   ];
  //   final List <String> ? result = await showDialog(context: context,
  //       builder: (BuildContext context){
  //         return MultiSelect
  //       },);
  //
  //   if(result != null){
  //     setState(() {
  //       _selectedOptions = result;
  //     });
  //   }
  // }

  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
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
                      'Sign Up',
                      style:
                          TextStyle(fontSize: 34, fontWeight: FontWeight.w700),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      // color: Color(0xff04385f),
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12)),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 30, 0),
                    child: Text('Traveler',
                        style: TextStyle(fontWeight: FontWeight.w500)),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      // color: Color(0xff04385f),
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12)),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 30, 0),
                    child: Text('Guide',
                        style: TextStyle(fontWeight: FontWeight.w500)),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 170,
                    height: 60,
                    child: TextField(
                      controller: firstnameController,
                      decoration: InputDecoration(
                          labelText: 'First Name',
                          hintText: 'First Name',
                          suffixIcon: Icon(Icons.person),
                          border: OutlineInputBorder()),
                    ),
                  ),
                  Container(
                    width: 170,
                    height: 60,
                    child: TextField(
                      controller: lastnameController,
                      decoration: InputDecoration(
                          labelText: 'Last Name',
                          hintText: 'Last Name',
                          suffixIcon: Icon(Icons.person),
                          border: OutlineInputBorder()),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Email',
                    suffixIcon: Icon(Icons.email),
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
                  suffixIcon: Icon(Icons.password),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Confirm Password',
                  labelText: 'Confirm Password',
                  suffixIcon: Icon(Icons.password),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  'By Signing Up, you agree to our Terms & Conditions',
                  style: TextStyle(fontSize: 12),
                ),
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
                      "Sign Up",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ),
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
                  Container(
                    child: GestureDetector(
                      onTap: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginSignUp()))
                      },
                      child: Container(
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                              color: Colors.greenAccent, fontSize: 14),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
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
      Response response = await post(

          // Uri.parse('https://dummyjson.com/auth/login'),

          Uri.parse('http://192.168.1.18:5000/api/user/login'),
          body: {
            'email': email,
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
