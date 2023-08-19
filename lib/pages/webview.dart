import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:image_picker/image_picker.dart';

class WebviewScreen extends StatefulWidget {
  String url;
   WebviewScreen( {super.key,required this.url});

  @override
  State<WebviewScreen> createState() => _WebviewScreenState();
}

class _WebviewScreenState extends State<WebviewScreen> {
  InAppWebViewController? _webViewController;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: InAppWebView(
          initialUrlRequest: URLRequest(
             // url: Uri.parse("http://omc.ienergydigital.com/mobile/auth/sign-in")
              url: Uri.parse(widget.url)
          ),
        initialOptions: InAppWebViewGroupOptions(
          crossPlatform: InAppWebViewOptions(
            javaScriptEnabled: true,
            useOnDownloadStart: true,
          ),
        ),
        onWebViewCreated: (controller) {
          _webViewController = controller;
          _webViewController!.addJavaScriptHandler(
            handlerName: 'imagePicker',
            callback: (args) async {
              await _invokeCamera();
            },
          );
        },),
    );
  }


  Future<void> _invokeCamera() async {
    final imageSource = await showDialog<ImageSource>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Image Source'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                GestureDetector(
                  child: Text('Camera'),
                  onTap: () {
                    Navigator.of(context).pop(ImageSource.camera);
                  },
                ),
                SizedBox(height: 16.0),
                GestureDetector(
                  child: Text('Gallery'),
                  onTap: () {
                    Navigator.of(context).pop(ImageSource.gallery);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );

    if (imageSource != null) {
      final pickedFile = await ImagePicker().getImage(
        source: imageSource,
      );

      if (pickedFile != null) {
        final imageBytes = await pickedFile.readAsBytes();
        final base64Image = base64Encode(imageBytes);
        final imageUrl = 'data:image/jpeg;base64,$base64Image';

        _webViewController?.evaluateJavascript(
          source: 'processPickedImage("$imageUrl");',
        );
      }
    }
  }
}
