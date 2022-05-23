import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../const.dart';
import '../utils.dart';

class ElmPage extends StatefulWidget {

  @override
  const ElmPage({Key? key}) : super(key: key);

  @override
  _ElmPageState createState() => _ElmPageState();
}

class _ElmPageState extends State<ElmPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(
                child: Text(""),
                flex: 1,
              ),
              ElevatedButton(
                onPressed: () {
                  Future<String> a = Utils.getCookies(Constants.elmurl);
                  a.then((value) => Utils.showAlert(value,context));
                },
                child: const Text("获取Cookie"),
              ),
            ],
          ),
          const Expanded(
            child: WebView(
              initialUrl: Constants.elmurl,
              javascriptMode: JavascriptMode.unrestricted,
            ),
            flex: 1,
          ),
        ],
      );
  }
}