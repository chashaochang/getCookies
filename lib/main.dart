import 'package:flutter/material.dart';
import 'package:getcookies/pages/elm.dart';
import 'package:getcookies/pages/jd.dart';
import 'package:getcookies/pages/meituan.dart';
import 'package:getcookies/utils.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'const.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: '获取京东/饿了么Cookie'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var currentIndex = 0;
  var allPages = [const JdPage(), const ElmPage(), const MeiTuanPage()];
  var allUrls = [Constants.jdurl, Constants.elmurl, Constants.meituanurl];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.blue,
          /*unselectedLabelStyle:TextStyle(
          color: Colors.black
        ),*/
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "京东",
              //backgroundColor:Colors.blue
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "饿了么",
              //backgroundColor:Colors.blue
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.apple),
              label: "美团",
              //backgroundColor:Colors.blue
            ),
          ],
          onTap: (index) {
            setState(() {
              print("the index is :$index");
              currentIndex = index;
            });
          },
        ),
        body:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(
                flex: 10,
                child: Text(""),
              ),
              ElevatedButton(
                onPressed: () {
                  Future<bool> a = Utils.clearCookies();
                  a.then((value) => Utils.toast(value ? "清除成功" : "清除失败"));
                },
                child: const Text("清除Cookie"),
              ),
              const Spacer(
                flex: 1,
              ),
              ElevatedButton(
                onPressed: () {
                  Future<String> a = Utils.getCookies(allUrls[currentIndex]);
                  a.then((value) => Utils.showAlert(value, context, type: currentIndex));
                },
                child: const Text("获取Cookie"),
              ),
            ],
          ),
          allPages[currentIndex]
        ]) //
        );
  }
}

// class Browser extends StatelessWidget {
//   const Browser({Key? key, required this.url, required this.title})
//       : super(key: key);
//
//   final String url;
//   final String title;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(title),
//       ),
//       body: WebView(
//         initialUrl: url,
//         javascriptMode: JavascriptMode.unrestricted,
//       ),
//     );
//   }
// }
