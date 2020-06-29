import 'dart:math';

import 'package:flutter/material.dart';

class MediumPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _backgroundApp(),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[_titles(), _roundedButtons()],
            ),
          )
        ],
      ),
      bottomNavigationBar: _bottomNavigationBar(context),
    );
  }

  Widget _backgroundApp() {
    final gradient = Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: FractionalOffset(0.0, 0.6),
              end: FractionalOffset(0.0, 1),
              colors: [
            Color.fromRGBO(52, 54, 101, 1.0),
            Color.fromRGBO(35, 37, 57, 1.0)
          ])),
    );

    final pinkBox = Transform.rotate(
        angle: -pi / 5.0,
        child: Container(
            height: 350.0,
            width: 360.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(90.0),
                color: Colors.pink,
                gradient: LinearGradient(colors: [
                  Color.fromRGBO(236, 98, 188, 1.0),
                  Color.fromRGBO(241, 142, 172, 1.0)
                ]))));

    return Stack(
      children: <Widget>[
        gradient,
        Positioned(
          child: pinkBox,
          top: -100.0,
        )
      ],
    );
  }

  Widget _titles() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Classify transaction',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text('Classify this transaction into a particular category',
                style: TextStyle(color: Colors.white, fontSize: 18.0)),
          ],
        ),
      ),
    );
  }

  Widget _bottomNavigationBar(BuildContext context) {
    return new Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Color.fromRGBO(55, 57, 84, 1.0),
          primaryColor: Colors.pinkAccent,
          textTheme: Theme.of(context).textTheme.copyWith(
              caption: TextStyle(color: Color.fromRGBO(116, 117, 152, 1.0))),
        ),
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.calendar_today,
                  size: 30.0,
                ),
                title: Container()),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.bubble_chart,
                  size: 30.0,
                ),
                title: Container()),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.supervised_user_circle,
                  size: 30.0,
                ),
                title: Container()),
          ],
        ));
  }

  Widget _roundedButtons() {
    return Table(
      children: [
        TableRow(children: [
          _roundedButton(),
          _roundedButton(),
        ]),
        TableRow(children: [
          _roundedButton(),
          _roundedButton(),
        ]),
      ],
    );
  }

  Widget _roundedButton() {
    return Container(
      height: 180.0,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          color: Color.fromRGBO(62, 66, 107, 0.7),
          borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          SizedBox(height: 2.0),
          CircleAvatar(
              backgroundColor: Colors.pinkAccent,
              radius: 35.0,
              child: Icon(Icons.swap_calls, color: Colors.white, size: 30.0)),
          Text(
            'Cosa',
            style: TextStyle(color: Colors.pinkAccent),
          ),
        ],
      ),
    );
  }
}
