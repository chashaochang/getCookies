import 'package:flutter/material.dart';
import 'package:getcookies/const.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../utils.dart';

class JdPage extends StatefulWidget {

  @override
  const JdPage({Key? key}) : super(key: key);

  @override
  _JdPageState createState() => _JdPageState();
}

class _JdPageState extends State<JdPage> {
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
                  Future<String> a = Utils.getCookies(Constants.jdurl);
                  a.then((value) => Utils.showAlert(value,context,isJd: true));
                },
                child: const Text("获取Cookie"),
              ),
            ],
          ),
          const Expanded(
            child: WebView(
              initialUrl: Constants.jdurl,
              javascriptMode: JavascriptMode.unrestricted,
            ),
            flex: 1,
          ),
        ],
      );
  }
}