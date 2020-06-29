import 'package:flutter/material.dart';

class ScrollPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
      scrollDirection: Axis.vertical,
      children: <Widget>[_page1(), _page2()],
    ));
  }

  Widget _page1() {
    return Stack(
      children: <Widget>[_backgrundColor(), _backgrundImage(), _createText()],
    );
  }

  Widget _page2() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Color.fromRGBO(108, 192, 218, 0.5),
      child: Center(
        child: RaisedButton(
            shape: StadiumBorder(),
            color: Colors.blue,
            textColor: Colors.white,
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal:40.0,vertical: 20.0),
                child: Text(
              'Bienvenidos',
              style: TextStyle(fontSize: 20.0),
            )),
            onPressed: () {}),
      ),
    );
  }

  Widget _backgrundColor() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Color.fromRGBO(108, 192, 218, 0.5),
    );
  }

  Widget _backgrundImage() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Image(
        image: AssetImage('assets/img/original.png'),
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _createText() {
    final textStyle = TextStyle(color: Colors.white, fontSize: 56.0);

    return SafeArea(
      child: Column(
        children: <Widget>[
          Text(
            '11º',
            style: textStyle,
          ),
          Text(
            'Miercoles',
            style: textStyle,
          ),
          Expanded(child: Container()),
          Icon(
            Icons.keyboard_arrow_down,
            size: 70.0,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
