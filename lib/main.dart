import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kholo/screens/home_page.dart';
import 'package:kholo/screens/students.dart';
import 'package:line_icons/line_icons.dart';

void main() => runApp(Kholo());

class Kholo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData(
          primaryColor: Colors.deepOrangeAccent,
          accentColor: Colors.deepPurpleAccent,
          canvasColor: Colors.grey[100],
          textTheme: TextTheme(
              display1: TextStyle(fontWeight: FontWeight.bold),
              display2:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black))),
      home: RootPage(),
    );
  }
}

class KholoPage {
  final int index;
  final String title;
  final Widget body;
  final TabBar tabBar;

  KholoPage(this.index, this.title, this.body, {this.tabBar});
}

var pages = [
  KholoPage(1, '', HomePage()),
  KholoPage(2, 'Students', Students(),
      tabBar: TabBar(
        indicatorColor: Colors.deepOrangeAccent,
        tabs: <Widget>[
          Tab(
            child: Text('My Students', style: TextStyle(color: Colors.black),),
          ),
          Tab(
            child: Text('All Students', style: TextStyle(color: Colors.black),),
          ),
        ],
      )),
  KholoPage(2, 'My Account', Text('Account Hee'))
];

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: pages[pageIndex]?.tabBar?.tabs?.length ?? 0,
      child: Scaffold(
        appBar: buildAppBar(),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              title: Text('Home'),
              icon: Icon(LineIcons.heart_o),
            ),
            BottomNavigationBarItem(
                title: Text('Students'), icon: Icon(LineIcons.child)),
            BottomNavigationBarItem(
                title: Text('Account'), icon: Icon(LineIcons.user))
          ],
          currentIndex: pageIndex,
          onTap: (index) => setState(() => pageIndex = index),
        ),
        body: pages[pageIndex].body,
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text(pages[pageIndex]?.title, style: TextStyle(color: Colors.black),),
      bottom: pages[pageIndex]?.tabBar ?? null,
      backgroundColor: Colors.white,
      elevation: 0,
      flexibleSpace: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Icon(
                LineIcons.bars,
                size: 32,
                color: Colors.deepOrangeAccent,
              ),
              Row(
                children: <Widget>[
                  Icon(LineIcons.search, size: 26),
                  SizedBox(
                    width: 18,
                  ),
                  Icon(LineIcons.bell, size: 26)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
