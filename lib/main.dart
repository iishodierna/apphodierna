import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
            title: Text("IIS Hodierna")
      ),
          body: WebView(
          initialUrl: "https://sites.google.com/iishodierna.edu.it/www-iishodierna-edu-it/home",
          javascriptMode: JavascriptMode.unrestricted,
          )
        ),
      );
    }
}
