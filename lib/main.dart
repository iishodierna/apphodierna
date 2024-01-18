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
          body: WebViewWidget(
              controller: WebViewController()
                ..setJavaScriptMode(JavaScriptMode.unrestricted)
                ..setNavigationDelegate(
                  NavigationDelegate(
                    onNavigationRequest: (NavigationRequest request) {
                      if (request.url.startsWith(
                          "https://sites.google.com/iishodierna.edu.it/www-iishodierna-edu-it/")) {
                        return NavigationDecision.navigate;
                      } else {
                        if (request.url.contains(
                            "https://www.youtube.com/embed") ||
                            request.url.contains(
                                "https://maps-api-ssl.google.com/maps") ||
                            request.url.contains(
                                "https://drive.google.com/auth_warmup")
                        ) {
                          return NavigationDecision.prevent;
                        }
                        _launchURL(request.url);
                        return NavigationDecision.prevent;
                      }
                    },
                  ),
                )
                ..loadRequest(Uri.parse(
                    'https://sites.google.com/iishodierna.edu.it/www-iishodierna-edu-it/home')))),
    );
  }

  _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }
}