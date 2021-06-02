import 'package:flutter/material.dart';
import 'package:attendance_qr/scan.dart';
import 'package:attendance_qr/attendanceSheet.dart';

class AttendanceRollPage extends StatefulWidget
{
  @override
  _AttendanceRollPageState createState() => _AttendanceRollPageState();
}

class _AttendanceRollPageState extends State<AttendanceRollPage>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(appBar: AppBar(title: Text("Attendance Roll"), centerTitle: true,),
        body: Container(height: MediaQuery.of(context).size.height, width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(20.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>
            [
              flatButton("Scan QR CODE", ScanPage()),
              SizedBox(height: 20.0,),
             // flatButton("Check Attendance", AttendanceSheetPage()),
            ],
          ),
        )
    );
  }
  Widget flatButton(String text, Widget widget)
  {
    return FlatButton(padding: EdgeInsets.all(15.0),
      onPressed: () async {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => widget));
      },
      child: Text(text, style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),),
      shape: RoundedRectangleBorder(side: BorderSide(color: Colors.blue,width: 3.0), borderRadius: BorderRadius.circular(20.0)),
    );
  }
}