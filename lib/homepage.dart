import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  final Completer<WebViewController> controller= Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 7,
        child: SafeArea(
          child: Scaffold(
            drawer: Drawer(
              child: ListView(
                children: [
                  DrawerHeader(child: Icon(Icons.compare)),
                  FlatButton(onPressed: null, child: Text('Free Services'))
                ],
              ),
            ),
            appBar :
//            PreferredSize(
//              preferredSize: Size.fromHeight(60),
//              child:
              AppBar(
                backgroundColor: Colors.red,
                flexibleSpace: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex:1,
                            child: SizedBox(
                            ),
                          ),
                          Expanded(
                            flex:6,
                            child: TabBar(
                              isScrollable: true,
                              tabs: [
                                IconButton(icon: Icon(Icons.home), onPressed: null),
                                IconButton(icon: Icon(Icons.face), onPressed: null),
                                IconButton(icon: Icon(Icons.transfer_within_a_station), onPressed: null),
                                IconButton(icon: Icon(Icons.g_translate), onPressed: null),
                                IconButton(icon: Icon(Icons.transfer_within_a_station), onPressed: null),
                                IconButton(icon: Icon(Icons.g_translate), onPressed: null),
                                IconButton(icon: Icon(Icons.g_translate), onPressed: null),

                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

            body: TabBarView(
              children : [
                Column(
                  children: [
                    Expanded(
                      child: WebView(
                        javascriptMode: JavascriptMode.unrestricted,
                        initialUrl: 'https://www.askganesha.com/',
                        onWebViewCreated: (WebViewController webViewController){
                          controller.complete(webViewController);
                          print('done');
                        },
                      ),
                    ),
                  ],
                ),
                Container(
                  child: Text('Mine'),
                ),
                Container(
                  child: Text('Mine'),
                ),
                Container(
                  child: Text('Mine'),
                ),
                Container(
                  child: Text('Mine'),
                ),
                Container(
                  child: Text('Mine'),
                ),
                Container(
                  child: Text('Mine'),
                ),
              ]

            )
            ),
           // body:
          ),

    );
  }
}
