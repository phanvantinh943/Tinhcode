import 'dart:convert';
import 'package:figma_app/App/CheckMail.dart';

import 'Home.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'SignIn.dart';
class ForgorPassword extends StatefulWidget {
  const ForgorPassword({super.key});

  @override
  State<ForgorPassword> createState() => _ForgorPasswordState();
}
TextEditingController emailController = TextEditingController();



class _ForgorPasswordState extends State<ForgorPassword> {
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
                    child: Text('Forgot Password', style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700),),
                  ),
                  SizedBox(height: 20),

                ],
              ),
              Center(
                child: Text('Input your email, we will send you an instruction to reset your password.', style: TextStyle(fontSize: 16),),
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

                    border: OutlineInputBorder(
                    )
                ),
              ),
              const SizedBox(height: 20,),
              GestureDetector(
                onTap: (){
                  sendMail(emailController.text.toString());
                },
                child: Container(
                  height: 60,
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text("Send", style: TextStyle(color: Colors.white, fontSize: 18),),
                  ),
                ),
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
  Future<void> sendMail(String email) async{
    try{
      Navigator.push(context, MaterialPageRoute(builder: (context)=> CheckMail()));
    }catch(e){
      print(e.toString());
    }
  }
}

