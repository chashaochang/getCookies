import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../const.dart';

class ElmPage extends StatefulWidget {
  @override
  const ElmPage({Key? key}) : super(key: key);

  @override
  _ElmPageState createState() => _ElmPageState();
}

class _ElmPageState extends State<ElmPage> {
  @override
  Widget build(BuildContext context) {
    return const Expanded(
      flex: 1,
      child: WebView(
        initialUrl: Constants.elmurl,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
