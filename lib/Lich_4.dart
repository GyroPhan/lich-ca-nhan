import 'package:flutter/material.dart';

import './Add.dart';

class Lich_4 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Lich_4_State();
  }
}

class Lich_4_State extends State<Lich_4> {
  DateTime _dateTime;
  var now = DateTime.now();
  var ngay;

  var checked;

  void Viec_lam() {
    for (int i = ngay; i < 32; i++) {
      if (i % 2 == 0) {
        checked = 1; // tao key cho tung ngay, dung ngay hien do
      } else {
        checked = 0;
      }
    }
    ;
  }

  Widget Viec_lam_2() {
    if (_dateTime == null) {
      return Text('Chon Ngay');
    } else {
      if (_dateTime.day % 2 == 1) {
        return Text('Lau Nha');
      } else {
        return Text('Ko Lau Nha');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // var _ngay = _dateTime.day.toInt(); // tai sao ko dc nam o tren + ko tao dc luon

    // TODO: implement build

    return Scaffold(
      appBar: AppBar(
          title: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text('LICH'),
          GestureDetector(
            child: Icon(Icons.add),
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Add()),
              );
            },
          ),
        ],
      )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text('${now}'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                RaisedButton(
                  child: Text('Pick a day'),
                  onPressed: () {

                  },
                ),
                Text(_dateTime == null
                    ? '${now.day} / ${now.month} / ${now.year}'
                    : '${_dateTime.day.toString()} / ${_dateTime.month.toString()} / ${_dateTime.year.toString()}'),
              ],
            ),

            //coi . dc gi o dau
            Viec_lam_2(),
          ],
        ),
      ),
    );
  }
}
