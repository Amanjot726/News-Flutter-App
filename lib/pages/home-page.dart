import 'package:flutter/material.dart';
import 'package:news_app/pages/News_Page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {

  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  @override

  var colors = [Colors.blue,Colors.orange,Colors.pink,Colors.deepPurple,Colors.green,Colors.black54];


  Color? primaryColor;

  Future getcolor() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? idx = prefs.getInt('color');
    print("color index = ${idx}");
    primaryColor = idx.runtimeType!=int?Colors.green:colors[idx!];
    setState(() {});
  }

  Future SetColor({int idx=1}) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('color');
    await prefs.setInt('color', idx);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getcolor();
  }

  var index = 0;

  var navigation_List = [
    "/home",
    "/settings"
  ];



  Widget build(BuildContext context) {

    return Scaffold(
      // backgroundColor: Color.fromARGB(235, 220, 245, 234),
      appBar: AppBar(
        title: Text("News",
          style: TextStyle(
          color: Color.fromARGB(185, 0, 0, 0),
          fontFamily: 'AlfaSlabOne',
          letterSpacing: 1.4
          ),
        ),
        backgroundColor: primaryColor,
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.more_vert,color: Color.fromARGB(185, 0, 0, 0)),
            onSelected: (value) {
              value!=index?Navigator.pushReplacementNamed(context, navigation_List[value as int]):"";
            },
            itemBuilder: (context)=>[
              PopupMenuItem(
                child: Text("Home"),
                value: 0,
              ),
              PopupMenuItem(
                child: Text("Settings"),
                value: 1,
              ),
            ],
          ),
        ],
      ),
      body: NewsPage(),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Color.fromARGB(35, 0, 0, 0),
              blurRadius: 8,
              spreadRadius: 1,
            ),
          ],
        ),
        child: BottomNavigationBar(
            elevation: 10,
            backgroundColor: Color.fromARGB(255, 241, 241, 241),
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  activeIcon: Icon(Icons.home),
                  label: "Home"
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings_outlined),
                  activeIcon: Icon(Icons.settings),
                  label: "Settings"
              ),
            ],
            currentIndex: index,
            selectedFontSize: 12,
            selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
            selectedItemColor: primaryColor,
            onTap: (idx) {
              setState(() {
                index!=idx ? Navigator.pushReplacementNamed(context, navigation_List[idx]) :
                index = idx;
              });
            }
        ),
      ),
    );
  }
}



