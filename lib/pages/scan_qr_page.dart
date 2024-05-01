import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:aid_repository/bloc/app_bloc.dart';
import 'package:aid_repository/pages/request_items_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanRequestPage extends StatefulWidget {
  const ScanRequestPage({Key? key}) : super(key: key);

  @override
  State<ScanRequestPage> createState() => _ScanRequestPageState();
}

class _ScanRequestPageState extends State<ScanRequestPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  late QRViewController controller;
  StreamSubscription<Barcode>? scanSubscription;
  TextEditingController editingController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller.pauseCamera();
    } else if (Platform.isIOS) {
      controller.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('Repository Scanner'),
        centerTitle: true,
        elevation: 2,
       
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 300,
            width: 300,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
              overlay: QrScannerOverlayShape(
                borderColor: Colors.orange,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Row(children: <Widget>[
            Expanded(child: Divider()),
            Text("OR"),
            Expanded(child: Divider()),
          ]),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: editingController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Request ID',
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 200,
            height: 50,
            child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.orange),
                ),
                child: const Text('Check', style: TextStyle(color: Colors.white)),
                onPressed: () {
                  BlocProvider.of<AppBloc>(context).add(GetRequestEvent(id: editingController.text));

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => RequestItemsPage()),
                  );
                }),
          )
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    controller.resumeCamera();
    this.controller = controller;
    scanSubscription = controller.scannedDataStream.listen((scanData) {
      scanSubscription!.cancel();
      BlocProvider.of<AppBloc>(context).add(GetRequestEvent(id: scanData.code!));
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => RequestItemsPage()),
      );

      controller.dispose();
      scanSubscription?.cancel();

      editingController.clear();
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    scanSubscription?.cancel();

    editingController.clear();
    super.dispose();
  }
}
