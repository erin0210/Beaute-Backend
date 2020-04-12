//import 'dart:math';
import 'package:flutter/material.dart';
//import 'package:social_app_ui/util/data.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Scanner extends StatefulWidget {
  @override
  _ScannerState createState() => _ScannerState();
}

class _ScannerState extends State<Scanner> {
  @override

  String barcode = "";
  Future scanBarcode() async {
    String barcodeResult = await FlutterBarcodeScanner.scanBarcode("aff6666", "Cancel", true);
  setState(() {
    barcode = barcodeResult;
  });
  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
    //      title: Text(widget.title),
      ),
      //backgroundimage
      body: Center(
        child: Column(
          children: <Widget>[
            QrImage(
              data: "Scan",
              size : 200,
            )

          ]
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: scanBarcode,
        tooltip:'Increment',
        child: Icon(Icons.scanner),
        ),
    );
  
  }
}
