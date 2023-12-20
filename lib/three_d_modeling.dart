import 'package:flutter/material.dart';
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
    ..setBackgroundColor(transparent)
    ..loadRequest(uri);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: WebViewWidget(controller: controller),
    );
  }
}
