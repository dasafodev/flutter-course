import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _sliderVal = 50.0;

  bool _lockCheck = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slides'),
      ),
      body: Container(
          padding: EdgeInsets.only(top: 50),
          child: Column(
            children: <Widget>[
              _createSlider(),
              _crateCheckBox(),
              _crateSwitch(),
              Expanded(child: _createImage())
            ],
          )),
    );
  }

  Widget _createSlider() {
    return Slider(
        activeColor: Colors.indigoAccent,
        label: 'Tamaño de la imagen',
        value: _sliderVal,
        min: 0.0,
        max: 500.0,
        onChanged: (_lockCheck)
            ? null
            : (val) {
                setState(() {
                  _sliderVal = val;
                });
              });
  }

  Widget _crateCheckBox() {
    return CheckboxListTile(
        title: Text('Bloquear slider'),
        value: _lockCheck,
        onChanged: (val) {
          setState(() {
            _lockCheck = val;
          });
        });
    // return Checkbox(
    //     value: _lockCheck,
    //     onChanged: (val) {
    //       setState(() {
    //         _lockCheck = val;
    //       });
    //     });
  }

  Widget _createImage() {
    return Image(
      image:
          NetworkImage('https://i.blogs.es/edeb0a/1366_2000-5-/840_560.jpeg'),
      width: _sliderVal,
      fit: BoxFit.contain,
    );
  }

  _crateSwitch() {
    return SwitchListTile(
        title: Text('Bloquear slider'),
        value: _lockCheck,
        onChanged: (val) {
          setState(() {
            _lockCheck = val;
          });
        });
  }
}
