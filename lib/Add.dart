import 'package:flutter/material.dart';
import 'package:lich_ca_nhan/Cong_Viec.dart';
import 'package:numberpicker/numberpicker.dart';

import './data.dart';
import './Cong_Viec.dart';

class Add extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Add_State();
  }
}

class Add_State extends State<Add> {

  DateTime _dateTime;
  var now = DateTime.now();
  var ngay;

  int _currentValue = 1;

//  final Cong_Viec cong_viec = Cong_Viec(cvTen: "ahahah "); // day la tao theo cach 1/ . M co the truyen tham so vao hay ko. cai nao m ko truyen thi la null
//  final Cong_Viec cong_viec = Cong_Viec("cvTen day", "cv Khoang cach day ", "" , ""); // day la tao theo cach 2/ thi bat buoc m phai truyen vao. Ko truyen vao thi bi loi~. Ngoai ra thi no' ko co khuc' goi. y nhu cach 1/

  final Cong_Viec cong_viec = Cong_Viec("cvTen day"); // cai nao trong ngoac thi can cai ten
  final Cong_Viec cong_viec1 = Cong_Viec("cvTen day", cvKhoangCach: "", cvNgay: "", cvMau: ""); // cai nao trong ngoac thi can cai ten
// ah h co hoc qua bai nay thi ra la vay :)) ... gi k hiu nua
  @override
  Widget build(BuildContext context) {
    final TextField _txtcvTen = TextField(
      decoration: InputDecoration(
        hintText: 'Nhập Việc Cần Làm',
        contentPadding: EdgeInsets.all(10.0),
        //padding cua phan noi dung ben trong
        border: InputBorder.none, //bỏ border đi, border ben trong cua textfeild
      ),
      keyboardType: TextInputType.text,
      autocorrect: false,
//      autocorrect: false, //ko hiện gợi ý nữa ???? là
      onChanged: (text) {
        setState(() {
          this.cong_viec.cvTen = text;
        }); //nhập và lưu đối tượng ??? day ne
      },
    );
    // Nguyen cau no noi roi do : Mot khi la final thi ko set dc gia' tri nua
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('ADD'),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 5.0, color: Colors.lime),
                borderRadius: BorderRadius.all(Radius.circular(
                    20.0)), // bo tròn border với bán kính 4pixel
              ),
              child: _txtcvTen,
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Text(
                    'NGÀY:',
                    style: TextStyle(fontSize: 35.0),
                  ),
                ),
                GestureDetector(
                  child: Text(
                    _dateTime == null
                        ? 'PICK A DAY'
                        : '${_dateTime.day.toString()} / ${_dateTime.month.toString()} / ${_dateTime.year.toString()}',
                    style: TextStyle(
                        fontSize: 35.0, color: Colors.deepOrange[400]),
                  ),
                  onTap: () {
                    showDatePicker(
                            context: context,
                            initialDate: _dateTime == null ? now : _dateTime,
                            firstDate: DateTime(2019),
                            lastDate: DateTime(2050))
                        .then((date) {
                      setState(() {
                        _dateTime = date;
                        ngay = _dateTime.day;
                      });
                    });
                  },
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Row(
                children: <Widget>[
                  Text(
                    'LẶP LẠI SAU:',
                    style:
                        TextStyle(fontSize: 35.0, color: Colors.deepOrange[400]),
                  ),
                  Container(
                    width: 40.0,
                    height: 40.0,
                    child: NumberPicker.integer(
                      initialValue: 1,
                      minValue: 0,
                      maxValue: 9,
                      onChanged: (newValue) =>
                          setState(() {
                            _currentValue = newValue;
                            print(_currentValue);
                          }) // muon print newValue cau truc nay copy tren mang, Tao di ra ngoai. tu nghien cuu cho nay nhe . Coi luc nao can => . luc nao dung () {}
                          ,
                    ),
                  ),
                  Text(
                    'NGÀY',
                    style:
                        TextStyle(fontSize: 35.0, color: Colors.deepOrange[400]),
                  ),
                ],
              ),
            ),
            GestureDetector(
              child: Text(
                'ADD',
                style: TextStyle(fontSize: 50, color: Colors.red[100]),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  //ok con cai nay nua
}
