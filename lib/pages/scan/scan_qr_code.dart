import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScanQrCode extends StatefulWidget {
  const ScanQrCode({super.key});

  @override
  State<ScanQrCode> createState() => _ScanQrCodeState();
}

class _ScanQrCodeState extends State<ScanQrCode> {
  String? scannedResult;
  bool isScanned = false;
  final MobileScannerController _controller = MobileScannerController();

  void _onDetect(BarcodeCapture capture) {
    final Barcode? barcode = capture.barcodes.first;
    if (!isScanned && barcode?.rawValue != null) {
      setState(() {
        scannedResult = barcode!.rawValue;
        isScanned = true;
      });

      _controller.stop();

      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text("QR Code Found"),
          content: Text(scannedResult!),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); 
              },
              child: const Text("OK"),
            ),
          ],
        ),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scan QR Code"),
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: MobileScanner(
              controller: _controller,
              onDetect: _onDetect,
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                scannedResult != null ? 'Result: $scannedResult' : 'Scan a QR Code',
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
