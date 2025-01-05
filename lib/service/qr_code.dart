import 'package:barcode_scan2/platform_wrapper.dart';
import 'package:flutter/material.dart';


class BarcodeScannerExample extends StatefulWidget {
  @override
  _BarcodeScannerExampleState createState() => _BarcodeScannerExampleState();
}

class _BarcodeScannerExampleState extends State<BarcodeScannerExample> {
  String? scanResult;

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Barcode Scanner Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              scanResult ?? 'Scan a Barcode/QR Code',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: startScan,
              child: Text('Start Scanning'),
            ),
          ],
        ),
      ),
    );
  }
  Future<void> startScan() async {
    try {
      final result = await BarcodeScanner.scan();
      setState(() {
        scanResult = result as String?;
      });
    } catch (e) {
      setState(() {
        scanResult = 'Failed to get scan result: $e';
      });
    }
  }
}
