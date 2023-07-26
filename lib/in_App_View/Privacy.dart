import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import '../Media_Qury/Media_Qury.dart';

class In_App_Privacy extends StatefulWidget {
  const In_App_Privacy({Key? key}) : super(key: key);

  @override
  State<In_App_Privacy> createState() => _In_App_PrivacyState();
}

class _In_App_PrivacyState extends State<In_App_Privacy> {
  double _process = 0;
  late InAppWebViewController webView;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(98, 104, 208, 25),
        title: Text('Privacy'),
      ),
      body: Stack(
        children: [
          InAppWebView(
            initialUrlRequest: URLRequest(url: Uri.parse('youtube.com')),
            onWebViewCreated: (InAppWebViewController controller) {
              webView = controller;
            },
            onProgressChanged:
                (InAppWebViewController controller, int process) {
              setState(() {
                _process = (process / 100);
              });
            },
          ),
          _process < 1
              ? Center(
                  child: Container(
                    height: ScreenSize.pSize_100(),
                    width: ScreenSize.pSize_100(),
                    child: Column(
                      children: [
                        Container(
                          height: ScreenSize.pSize_40(),
                          width: ScreenSize.pSize_40(),
                          child: CircularProgressIndicator(
                            strokeWidth: ScreenSize.pSize_4(),
                            value: _process,
                          ),
                        ),
                        SizedBox(
                          height: ScreenSize.pSize_10(),
                        ),
                        Text('Loading...',
                            style: TextStyle(fontSize: ScreenSize.pSize_18())),
                      ],
                    ),
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
