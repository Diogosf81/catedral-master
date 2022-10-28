import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class FcfScreen extends StatefulWidget {
  @override
  FcfScreenState createState() => FcfScreenState();
}

class FcfScreenState extends State<FcfScreen> {
  Completer<WebViewController> _controller = Completer<WebViewController>();

  // WebViewController? webViewController;
  final webViewKey = GlobalKey<FcfScreenState>();
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
        title: const Text('FCF'),
        actions: <Widget>[
          NavigationControls(_controller.future),
          IconButton(
              onPressed: () {
                //webViewKey.currentState?.reloadWebView();
              },
              icon: Icon(Icons.autorenew)),
        ],
      ),
      body: Stack(
        children: [
          WebView(
            initialUrl: 'https://www.faculdadecatedraldafamilia.com.br/1/home/',
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
                      Text(
                        "Carregando",
                        style: TextStyle(
                            color: Color.fromARGB(255, 22, 125, 127),
                            fontSize: 20),
                      )
                    ],
                  ),
                )
              : Stack()
          // Center(
          //         child: Container(
          //           width: MediaQuery.of(context).size.width,
          //           height: MediaQuery.of(context).size.height,
          //           color: Colors.white,
          //           child: Column(
          //             mainAxisAlignment: MainAxisAlignment.center,
          //             children: [
          //               Icon(
          //                 Icons.cloud_off,
          //                 size: 60,
          //                 color: Colors.grey,
          //               ),
          //               Padding(
          //                 padding: const EdgeInsets.symmetric(
          //                     vertical: 10, horizontal: 40),
          //                 child: Text(
          //                   "Ocorreu um erro ao carregar. Verifique sua internet.",
          //                   textAlign: TextAlign.center,
          //                   style: TextStyle(
          //                     color: Colors.grey,
          //                     fontSize: 18,
          //                     fontWeight: FontWeight.bold,
          //                   ),
          //                 ),
          //               )
          //             ],
          //           ),
          //         ),
          //       )
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
