import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: Text("IIS Hodierna")),
          body: WebView(
            initialUrl:
                "https://sites.google.com/iishodierna.edu.it/www-iishodierna-edu-it/home",
            javascriptMode: JavascriptMode.unrestricted,
/*            onWebViewCreated: (WebViewController webViewController) {
              _controller.complete(webViewController);
            },*/
            navigationDelegate: (NavigationRequest request) {
              if (request.url.startsWith(
                  "https://sites.google.com/iishodierna.edu.it/www-iishodierna-edu-it/")) {
                return NavigationDecision.navigate;
              } else {
                _launchURL(request.url);
                return NavigationDecision.prevent;
              }
            },
          )
      ),
    );
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
