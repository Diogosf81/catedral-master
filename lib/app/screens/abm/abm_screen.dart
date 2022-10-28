import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AbmScreen extends StatefulWidget {
  @override
  AbmScreenState createState() => AbmScreenState();
}

class AbmScreenState extends State<AbmScreen> {
  Completer<WebViewController> _controller = Completer<WebViewController>();

  final webViewKey = GlobalKey<AbmScreenState>();
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 22, 125, 127),
        title: const Text('ABM'),
        // This drop down menu demonstrates that Flutter widgets can be shown over the web view.
        actions: <Widget>[
          NavigationControls(_controller.future),
          IconButton(
              onPressed: () {
                // webViewKey.currentState?.reloadWebView();
              },
              icon: Icon(Icons.autorenew)),
        ],
      ),
      body: Stack(
        children: [
          WebView(
            initialUrl: 'https://www.abmanancial.com.br/',
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              _controller.complete(webViewController);
            },
            onPageFinished: (finish) {
              setState(() {
                isLoading = false;
              });
            },
          ),
          isLoading
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(
                          color: Color.fromARGB(255, 22, 125, 127)),
                      Text("Carregando", style: TextStyle(color: Color.fromARGB(255, 22, 125, 127), fontSize: 20),)
                    ],
                  ),
                )
              : Stack(),
        ],
      ),
    );
  }
}

// class WebViewContainer extends StatefulWidget {
//   WebViewContainer({Key key}) : super(key: key);
//
//   @override
//   WebViewContainerState createState() => WebViewContainerState();
// }
//
// class WebViewContainerState extends State<WebViewContainer> {
//   late WebViewController _webViewController;
//
//   @override
//   Widget build(BuildContext context) {
//     return WebView(
//       onWebViewCreated: (controller) {
//         _webViewController = controller;
//       },
//       initialUrl: "https://stackoverflow.com",
//     );
//   }
//
//   void reloadWebView() {
//     _webViewController?.reload();
//   }
// }

class NavigationControls extends StatelessWidget {
  const NavigationControls(this._webViewControllerFuture)
      : assert(_webViewControllerFuture != null);

  final Future<WebViewController> _webViewControllerFuture;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<WebViewController>(
      future: _webViewControllerFuture,
      builder:
          (BuildContext context, AsyncSnapshot<WebViewController> snapshot) {
        final bool webViewReady =
            snapshot.connectionState == ConnectionState.done;
        final WebViewController? controller = snapshot.data;
        return Row(
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: !webViewReady
                  ? null
                  : () => navigate(context, controller!, goBack: true),
            ),
            IconButton(
              icon: const Icon(Icons.arrow_forward_ios),
              onPressed: !webViewReady
                  ? null
                  : () => navigate(context, controller!, goBack: false),
            ),
          ],
        );
      },
    );
  }

  navigate(BuildContext context, WebViewController controller,
      {bool goBack: false}) async {
    bool canNavigate =
        goBack ? await controller.canGoBack() : await controller.canGoForward();
    if (canNavigate) {
      goBack ? controller.goBack() : controller.goForward();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
                "A página não pode ir ${goBack ? 'para trás' : 'para frente'}")),
      );
    }
  }
}
