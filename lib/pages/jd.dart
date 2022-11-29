import 'package:flutter/material.dart';
import 'package:getcookies/const.dart';
import 'package:webview_flutter/webview_flutter.dart';

class JdPage extends StatefulWidget {
  @override
  const JdPage({Key? key}) : super(key: key);

  @override
  _JdPageState createState() => _JdPageState();
}

class _JdPageState extends State<JdPage> {

  void refresh(){

  }

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      flex: 1,
      child: WebView(
        initialUrl: Constants.jdurl,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
