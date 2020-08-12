import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:medi_lan3/Navigation/a.dart';
import 'package:medi_lan3/Navigation/b.dart';
import 'package:medi_lan3/Navigation/c.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),  
      ),
    );
  }
}

class bottoNav extends StatefulWidget{
  @override
  _bottonNav createState() => _bottonNav();
}

class _bottonNav extends State<bottoNav> {
  var _page = 0;
  
  final pages = [a(), b(), c()];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        index: 0,
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        backgroundColor: Colors.blue,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index){
          setState((){
            _page=index;
          }
            
          );

        },

        items: [
          Icon(Icons.calendar_today),
          Icon(Icons.person_outline),
          Icon(Icons.note)
        ]
        ),
        body: pages[_page],
    );
  }

}
