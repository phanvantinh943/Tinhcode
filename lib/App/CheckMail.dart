import 'dart:convert';
import 'Home.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'SignIn.dart';
class CheckMail extends StatefulWidget {
  const CheckMail({super.key});

  @override
  State<CheckMail> createState() => _CheckMailState();
}
TextEditingController emailController = TextEditingController();



class _CheckMailState extends State<CheckMail> {
  @override


  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding( padding: const EdgeInsets.all(0),

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
                    child: Text('Check Email', style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700),),
                  ),
                  SizedBox(height: 20),

                ],
              ),
              Center(
                child: Text('Please check your email for the instructions on how to reset your password..', style: TextStyle(fontSize: 16),),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child:  Image.asset('assets/images/envelope.jpg'),
              ),

              SizedBox(height: 40,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Container(
                    child: Text('Back to', style: TextStyle(fontSize: 14),),
                  ),
                  Container(
                    child: GestureDetector(
                      onTap: () => {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginSignUp()))
                      },
                      child: Container(
                        child: Text('Sign In', style: TextStyle(color: Colors.greenAccent, fontSize: 14),),
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
        ),),
    );
  }
  Future<void> login(String email ,String password) async{
    try{
      Response response = await post(

        // Uri.parse('https://dummyjson.com/auth/login'),

          Uri.parse('http://192.168.1.18:5000/api/user/login'),
          body: {
            'email': email,
            'password': password,
          }
      );
      if(email.isEmpty || password.isEmpty){
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Missing input",), backgroundColor: Colors.red,));
      }else if(response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data);
        // var data1 = jsonEncode(data);
        // print(data1);
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Login success")));
        print('Response body: ${response.body}');
        Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
      }else if(response.statusCode == 404){
        print('Not found');
      }else{
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar( content: Text("Invalid Credential"), backgroundColor: Colors.red,));
      }
    }catch(e){
      print(e.toString());
    }
  }
}

