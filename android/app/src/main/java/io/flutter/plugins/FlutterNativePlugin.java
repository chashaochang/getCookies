package io.flutter.plugins;

import android.webkit.CookieManager;
import android.webkit.ValueCallback;

import androidx.annotation.NonNull;

import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;

public class FlutterNativePlugin implements MethodChannel.MethodCallHandler {

    public static String CHANNEL = "com.test/name";

    static MethodChannel channel;

    public static void registerWith(BinaryMessenger messenger) {
        channel = new MethodChannel(messenger, CHANNEL);
        FlutterNativePlugin instance = new FlutterNativePlugin();
        channel.setMethodCallHandler(instance);
    }

    @Override
    public void onMethodCall(MethodCall methodCall, @NonNull MethodChannel.Result result) {
        switch (methodCall.method) {
            case "getAllCookies":
                getAllCookies(methodCall, result);
                break;
            case "clearAllCookies":
                clearAllCookies(methodCall, result);
                break;
            default:
                result.notImplemented();
                break;
        }
    }

    private void getAllCookies(MethodCall call, final MethodChannel.Result result) {
        String url = call.argument("url");
        CookieManager cookieManager = CookieManager.getInstance();
        String cookieStr = cookieManager.getCookie(url);
        result.success(cookieStr);
    }

    private void clearAllCookies(MethodCall call, final MethodChannel.Result result) {
        CookieManager cookieManager = CookieManager.getInstance();
        cookieManager.removeAllCookies(aBoolean -> {
            if (aBoolean) {
                result.success(true);
            } else {
                result.error("0", "清除失败", null);
            }
        });
    }
}