import 'package:flutter/material.dart';
import 'package:qlduhoc/homepage/home/HomePage.dart';
import 'package:qlduhoc/homepage/mainpage.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  Widget build(BuildContext context) {
    new Future.delayed(new Duration(seconds: 3), () {
      // Navigator.pushNamedAndRemoveUntil(
      //     context, 'FirtPage', (Route<dynamic> route) => false);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> MainPage()));
    });
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(color: Color.fromRGBO(125, 31, 31, 1.0)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                  child: Image.asset('assets/logo.png')),
              CircularProgressIndicator(
                backgroundColor: Colors.white,
                strokeWidth: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
