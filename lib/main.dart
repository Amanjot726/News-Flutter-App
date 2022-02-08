import 'package:flutter/material.dart';
import 'package:news_app/pages/splash-page.dart';
import 'package:news_app/pages/home-page.dart';
import 'package:flutter/services.dart';
import 'package:news_app/pages/Settings_Page.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget{


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);
    return MaterialApp(
      title: 'News',
      // theme: ThemeData(
      //   // This is the theme of your application.
      //   //
      //   // Try running your application with "flutter run". You'll see the
      //   // application has a blue toolbar. Then, without quitting the app, try
      //   // changing the primarySwatch below to Colors.green and then invoke
      //   // "hot reload" (press "r" in the console where you ran "flutter run",
      //   // or simply save your changes to "hot reload" in a Flutter IDE).
      //   // Notice that the counter didn't reset back to zero; the application
      //   // is not restarted.
      //   primarySwatch: Colors.blue,
      // ),
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => SplashPage(),
        "/home": (context) => HomePage(),
        "/settings": (context) => SettingsPage(),
      },
      initialRoute: "/",
    );
  }
}

// class HomePage extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromARGB(235, 220, 245, 234),
//       // appBar: AppBar(
//       //   title: Text("News"),
//       //   backgroundColor: Colors.green,
//       //   actions: [
//       //     PopupMenuButton(
//       //       itemBuilder: (context)=>[
//       //         PopupMenuItem(
//       //           child: Text("Item 1"),
//       //           value: 1,
//       //         ),
//       //         PopupMenuItem(
//       //           child: Text("Item 2"),
//       //           value: 2,
//       //         ),
//       //       ],
//       //     ),
//       //   ],
//       // ),
//       body: SplashPage(),
//     );
//   }
// }