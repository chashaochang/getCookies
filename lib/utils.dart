import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:getcookies/const.dart';

class Utils {
  static Future<String> getCookies(String initUrl) async {
    const platform = MethodChannel(Constants.channel);
    return await platform.invokeMethod("getAllCookies", {'url': initUrl});
  }

  static Future<bool> clearCookies() async {
    const platform = MethodChannel(Constants.channel);
    return await platform.invokeMethod("clearAllCookies");
  }

  static String getCookieByName(String cookiess, String cookieKey) {
    var cookies = cookiess.split(';');
    var cookieValue = "";
    for (var rawCookie in cookies) {
      if (rawCookie.isNotEmpty) {
        var keyValue = rawCookie.split('=');
        if (keyValue.length == 2) {
          var key = keyValue[0].trim();
          var value = keyValue[1];
          if (key == cookieKey) {
            cookieValue = value;
          }
        }
      }
    }
    return cookieValue;
  }

  /// @param type 0 jd 1 elm 2 mt
  static void showAlert(String str, BuildContext context, {int type = 0}) {
    print(str);
    var text = "";
    switch (type) {
      case 0:
        {
          text =
              "pt_key=${getCookieByName(str, "pt_key")};pt_pin=${getCookieByName(str, "pt_pin")};";
          break;
        }
      case 1:
        {
          text =
              "USERID=${getCookieByName(str, "USERID")};SID=${getCookieByName(str, "SID")};cookie2=${getCookieByName(str, "cookie2")};";
          break;
        }
      case 2:
        {
          text =
              "userId=${getCookieByName(str, "userId")}&token=${getCookieByName(str, "token")};";
          break;
        }
      default:
        {
          text = str;
        }
    }
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text("提示"),
              content: Text(text),
              actions: <Widget>[
                TextButton(
                  child: const Text("取消"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: const Text("复制到剪贴板"),
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: text));
                    Fluttertoast.showToast(
                        msg: "已复制到剪贴板！",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ));
  }

  static void toast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
