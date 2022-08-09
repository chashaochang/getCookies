import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../const.dart';
import '../utils.dart';

class MeiTuanPage extends StatefulWidget {

  @override
  const MeiTuanPage({Key? key}) : super(key: key);

  @override
  _MeiTuanPageState createState() => _MeiTuanPageState();
}

class _MeiTuanPageState extends State<MeiTuanPage> {
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
                  Future<String> a = Utils.getCookies(Constants.meituanurl);
                  a.then((value) => Utils.showAlert(value,context,isMeiTuan: true));
                },
                child: const Text("获取Cookie"),
              ),
            ],
          ),
          const Expanded(
            child: WebView(
              initialUrl: Constants.meituanurl,
              javascriptMode: JavascriptMode.unrestricted,
            ),
            flex: 1,
          ),
        ],
      );
  }
}