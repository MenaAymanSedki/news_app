import 'package:flutter/material.dart';
import 'package:flutter_webview_pro/webview_flutter.dart';
class WebViewScreen extends StatelessWidget
{
   final String url;

   WebViewScreen(this.url);

  @override
  Widget build(BuildContext context)
  {

    return Scaffold(
      appBar: AppBar(),
      body:const WebView(
        initialUrl:'url',
      ),



    );
  }
}
