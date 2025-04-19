import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrResultPage extends StatelessWidget {
  final String data;

  const QrResultPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: const Text(
          'Your QR Code',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            QrImageView(data: data, version: QrVersions.auto, size: 200.0),
            const SizedBox(height: 20),
            Text("Data: $data", textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
