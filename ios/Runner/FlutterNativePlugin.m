//
//  FlutterIosPay.m
//  Runner
//
//  Created by 小白 on 2022/2/5.
//

#import "FlutterNativePlugin.h"

#import <WebKit/WebKit.h>

@implementation FlutterNativePlugin

+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar> *)registrar{
    FlutterMethodChannel *channel = [FlutterMethodChannel methodChannelWithName:@"com.test/name" binaryMessenger:[registrar messenger]];
    FlutterNativePlugin *instance = [[FlutterNativePlugin alloc]init];
    [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall *) call result:(FlutterResult)result {
    if ([call.method isEqualToString:@"getAllCookies"]) {
        [self getAllCookies:call completionHandler:^(NSString *cookies) {
                      result(cookies);
                  }];
    } else if([call.method isEqualToString:@"clearCookies"]){
        [self clearCookies:call completionHandler:(BOOL res) {
                          result(res);
                      }];
    } else {
        result(FlutterMethodNotImplemented);
    }
}

- (void)getAllCookies:(FlutterMethodCall*)call completionHandler:(void (^_Nullable)(NSString *cookies))completionHandler {
    NSString *urlString = call.arguments[@"url"];
    NSString *allCookies = @"";
    NSHTTPCookieStorage *cookieStorage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    for (NSHTTPCookie *cookie in [cookieStorage cookies]) {
        NSString *temp = [NSString stringWithFormat:@"%@=%@;",cookie.name,cookie.value];
        allCookies = [allCookies stringByAppendingString:temp];
    }
    completionHandler([NSString stringWithFormat:@"%@", allCookies]);
}

- (void)clearCookies:(FlutterMethodCall*)call
     completionHandler:(void (^_Nullable)(BOOL result))completionHandler {
    +(void)clearCookie {
        // allWebsiteDataTypes清除所有缓存
        NSArray *types = @[WKWebsiteDataTypeCookies];
        NSSet *websiteDataTypes= [NSSetsetWithArray:types];
        NSDate *dateFrom = [NSDate dateWithTimeIntervalSince1970:0];
        [[WKWebsiteDataStore defaultDataStore] removeDataOfTypes:websiteDataTypes modifiedSince:dateFrom completionHandler:^{
        }];
        //清除cookies
        NSHTTPCookie*cookie;
        NSHTTPCookieStorage *storage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
        for(cookiein[storagecookies]){
            [storagedeleteCookie:cookie];
        }
    }
    completionHandler(true);
}

@end
