import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  final String articalurl;
  const WebViewScreen({Key? key, required this.articalurl}) : super(key: key);

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {

  late final WebViewController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = WebViewController()..loadRequest(
        Uri.parse(widget.articalurl)
    )..setJavaScriptMode(JavaScriptMode.disabled);
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:AppBar(
      ),
      body: WebViewWidget(controller: controller),

    );
  }
}
