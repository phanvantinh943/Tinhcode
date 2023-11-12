import 'dart:convert';
import 'package:figma_app/App/OnBoarding_02.dart';

import 'Home.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'SignIn.dart';
class OnBoarding_01 extends StatefulWidget {
  const OnBoarding_01({super.key});

  @override
  State<OnBoarding_01> createState() => _OnBoarding_01State();
}
TextEditingController emailController = TextEditingController();



class _OnBoarding_01State extends State<OnBoarding_01> {
  @override


  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding( padding: const EdgeInsets.all(0),

        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 60, 0, 0),
                      width: 347.55,
                      height: 466.16,
                      child: Image.asset('assets/images/Vector 7.png'),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 100, 0, 0),
                      width: 91.26,
                      height: 39.57,
                      child: Image.asset('assets/images/Vector 5 (1).png'),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(35, 189, 0, 0),
                            width: 125.16,
                            height: 278.02,
                            child: Image.asset('assets/images/Group 108.png'),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 186.99, 0, 0),
                            width: 154.16,
                            height: 282.3,
                            child: Image.asset('assets/images/Group 107.png'),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text('Find a local guide easily ', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: 252,
                      height: 73,
                      child:  Center(

                        child: Text('With Fellow4U, you can find a local guide for you trip easily and explore as the way you want.', style: TextStyle(fontSize: 16),),
                      ),
                    )
                  ],
                ),

                SizedBox(
                  height: 20,
                ),
                Container(
                  child:  Image.asset('assets/images/Group 2.png'),
                ),

                SizedBox(height: 40,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      child: GestureDetector(
                        onTap: () => {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => OnBoarding_02()))
                        },
                        child: Container(
                          child: Text('SKIP', style: TextStyle(color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w500),),
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

