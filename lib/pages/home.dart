import 'package:flutter/material.dart';
import 'package:test_project/pages/generate/generate_qr_code.dart';
import 'package:test_project/pages/scan/scan_qr_code.dart';
import 'package:test_project/widgets/button.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: 
      
      AppBar(
        title: Text("QR Tool", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Button(
                text: "Scan QR Code",
                action: () {
                  Navigator.of(
                    context,
                  ).push(MaterialPageRoute(builder: (context) => ScanQrCode()));
                },
              ),
              Button(
                text: "Generate QR Code",
                action: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => GenerateQrCode()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
