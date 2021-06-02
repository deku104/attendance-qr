import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:attendance_qr/model/form.dart';
import 'package:attendance_qr/controller.dart';

class ScanPage extends StatefulWidget
{
  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage>
{
  String qrCodeResult = "Not Yet Scanned";



  void _submitForm()
  {
    FeedbackForm feedbackForm = FeedbackForm(qrCodeResult);

      FormController formController = FormController((String response){
        print("Response: $response");
        if(response == FormController.STATUS_SUCCESS){
          //
          _showSnackbar("Attendance Submitted");
        } else {
          _showSnackbar("Error Occurred!");
        }
      });

      _showSnackbar("Submitting Attendance");

      // Submit 'feedbackForm' and save it in Google Sheet

      formController.submitForm(feedbackForm);
  }
  _showSnackbar(String message) {
    final snackBar = SnackBar(content: Text(message));
   // _scaffoldKey.currentState.showSnackBar(snackBar);
  }




  @override
  Widget build(BuildContext context)
  {
    return Scaffold(appBar: AppBar(title: Text("Take Attendance"), centerTitle: true,),
      body: Container(padding: EdgeInsets.all(20.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>
          [
            Text("Result", style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
            Text(qrCodeResult, style: TextStyle(fontSize: 20.0,), textAlign: TextAlign.center,),
            SizedBox( height: 20.0,),
            FlatButton(padding: EdgeInsets.all(15.0),
              onPressed: () async {
                String codeScanner = await BarcodeScanner.scan() as String; //barcode scanner
                setState(() {qrCodeResult = codeScanner;});

                // try{ BarcodeScanner.scan()
                //    this method is used to scan the QR code
                // }catch (e){
                // BarcodeScanner.CameraAccessDenied; we can print that user has denied for the permissions
                //  BarcodeScanner.UserCanceled; we can print on the page that user has cancelled
                // }

              },
              child: Text("Open Scanner", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
              shape: RoundedRectangleBorder(side: BorderSide(color: Colors.blue, width: 3.0), borderRadius: BorderRadius.circular(20.0)),
            )
          ],
        ),
      ),
    );
  }
}