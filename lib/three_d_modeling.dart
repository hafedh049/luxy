import 'package:flutter/material.dart';
import 'package:luxy/utils/globals.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ThreeDModeling extends StatefulWidget {
  const ThreeDModeling({super.key});

  @override
  State<ThreeDModeling> createState() => _ThreeDModelingState();
}

class _ThreeDModelingState extends State<ThreeDModeling> {
  final WebViewController _webViewController = WebViewController()
    ..enableZoom(false)
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(transparent);

  @override
  void dispose() {
    _webViewController.clearCache();
    _webViewController.clearLocalStorage();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewWidget(
        controller: _webViewController
          ..loadRequest(
            Uri.parse("https://app.vectary.com/p/71YmSSOh9Q2wT7qGbku5xs"),
          ),
      ),
    );
  }
}
