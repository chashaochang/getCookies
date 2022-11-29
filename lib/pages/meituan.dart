import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../const.dart';

class MeiTuanPage extends StatefulWidget {
  @override
  const MeiTuanPage({Key? key}) : super(key: key);

  @override
  _MeiTuanPageState createState() => _MeiTuanPageState();
}

class _MeiTuanPageState extends State<MeiTuanPage> {
  @override
  Widget build(BuildContext context) {
    return const Expanded(
      flex: 1,
      child: WebView(
        initialUrl: Constants.meituanurl,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
