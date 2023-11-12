import 'package:figma_app/App/SignIn.dart';
import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Welcome User"),
              SizedBox(
                height: 50,
              ),
              OutlinedButton.icon(onPressed: (){
                Navigator.push(context,
                MaterialPageRoute(builder: (context)=>LoginSignUp()));

              }, icon: Icon(Icons.exit_to_app, size: 18,), label: Text('Logout'),)
            ],


          ),
        ),
      ),

    );
  }
}
