// import 'dart:html';
import 'dart:ui';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  navigateToHome(BuildContext context){
    Future.delayed(
        Duration(seconds: 4),
        (){
          Navigator.pushReplacementNamed(context, "/home");
        }
    );
  }
  
  @override
  Widget build(BuildContext context) {
    
    navigateToHome(context);
    
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/news.png",width: 85,),
            SizedBox(height: 6,),
            Text("News",
                style: TextStyle(
                    color: Color.fromARGB(255, 93, 143, 201),
                    fontSize: 22,
                    fontWeight: FontWeight.bold
                )
            ),
            SizedBox(height: 6,),
            Text("For Most Countries",
                style: TextStyle(
                    color: Colors.black26,
                    fontSize: 15,
                    fontWeight: FontWeight.bold
                )
            ),
          ],
        ),
      ),
    );
  }
}
