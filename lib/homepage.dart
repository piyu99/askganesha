import 'dart:async';
import 'dart:io';
import 'package:askganesha/second.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
        length: 5,
        child: SafeArea(
          child: Scaffold(
            drawer: Drawer(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(child: DrawerHeader(child: Image.asset('assets/ganesha.png'))),
                    FlatButton(
                      child: Text('Free Services',
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),),
                       onPressed: (){
                        Navig('Free Services','https://www.askganesha.com/free-astrology/default-free');
                         },),
                    FlatButton(
                      child: Text('Free Horoscopes',
                        style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),),
                      onPressed: (){
                        Navig('Free Horoscopes','https://www.askganesha.com/free-astrology/free-horoscope');
                      },),
                    FlatButton(
                      child: Text('Remedies',
                        style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),),
                      onPressed: (){
                        Navig('Remedies','https://www.askganesha.com/astrology-remedies');
                      },),
                    FlatButton(
                      child: Text('Personalised Reports',
                        style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),),
                      onPressed: (){
                        Navig('Personalised Reports','https://www.askganesha.com/more-reports');
                      },),
                    FlatButton(
                      child: Text('Consult the Astrologer',
                        style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),),
                      onPressed: (){
                        Navig('Consult the Astrologer','https://www.askganesha.com/more-reports');
                      },),
                    FlatButton(
                      child: Text('Upcoming Festivals',
                        style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),),
                      onPressed: (){
                        Navig('Upcoming Festivals','https://www.askganesha.com/festivals');
                      },),
                    FlatButton(
                      child: Text('Tap Counter',
                        style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),),
                      onPressed: (){
                        Navig('Tap Counter','https://valera-rozuvan.github.io/online-counter/');
                      },),
                    Divider(),
                    FlatButton(
                      child: Text('Contact Us',
                        style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),),
                      onPressed: (){
                        Navig('Contact Us','https://www.askganesha.com/contact');
                      },),
//                    FlatButton(
//                      child: Text('Share App',
//                        style: TextStyle(
//                            fontWeight: FontWeight.bold
//                        ),),
//                      onPressed: (){
//                        Navig('Like us on Facebook','https://www.facebook.com/studyabacus/');
//                      },),
                    FlatButton(
                      child: Text('Like us on Facebook',
                        style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),),
                      onPressed: (){
                        Navig('Like us on Facebook','https://www.facebook.com/studyabacus/');
                      },),
                  ],
                ),
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
                            child: SizedBox(),
                          ),
                          Expanded(
                            flex:6,
                            child: TabBar(
                              isScrollable: true,
                              tabs: [
                                FaIcon(FontAwesomeIcons.home, size: 25,),
                                FaIcon(FontAwesomeIcons.facebook, size: 25,),
                                FaIcon(FontAwesomeIcons.youtube, size: 25,),
                                FaIcon(FontAwesomeIcons.twitter, size: 25,),
                                FaIcon(FontAwesomeIcons.rocketchat, size: 25,),

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
                WebView(
                  javascriptMode: JavascriptMode.unrestricted,
                  initialUrl: 'https://www.askganesha.com/',
                  onWebViewCreated: (WebViewController webViewController){
                    controller.complete(webViewController);

                  },
                ),
                WebView(
                  javascriptMode: JavascriptMode.unrestricted,
                  initialUrl: 'https://www.facebook.com/askganesa/',
                  onWebViewCreated: (WebViewController webViewController){
                    controller.complete(webViewController);

                  },
                ),
                WebView(
                  javascriptMode: JavascriptMode.unrestricted,
                  initialUrl: 'https://www.youtube.com/user/accurateastrologers',
                  onWebViewCreated: (WebViewController webViewController){
                    controller.complete(webViewController);
                  },
                ),
                WebView(
                  javascriptMode: JavascriptMode.unrestricted,
                  initialUrl: 'https://twitter.com/askganesha?lang=en',
                  onWebViewCreated: (WebViewController webViewController){
                    controller.complete(webViewController);
                  },
                ),
                WebView(
                  javascriptMode: JavascriptMode.unrestricted,
                  initialUrl: 'http://blog.askganesha.com/',
                  onWebViewCreated: (WebViewController webViewController){
                    controller.complete(webViewController);
                  },
                ),
              ]

            )
            ),
           // body:
          ),

    );
  }
  void Navig(String name,String url){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Secondary(name,url)));

  }
}

