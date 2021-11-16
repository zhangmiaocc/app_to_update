#import "AppToUpdatePlugin.h"

@implementation AppToUpdatePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"app_to_update"
            binaryMessenger:[registrar messenger]];
    AppToUpdatePlugin* instance = [[AppToUpdatePlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"updateVersion" isEqualToString:call.method]) {
      NSString *AppleId = call.arguments[@"AppleId"];
      if (AppleId.length > 0) {
          // 尝试跳转到 App Store
          NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"itms-apps://itunes.apple.com/app/id%@",AppleId]];
          if (@available(iOS 10.0, *)) {
              [UIApplication.sharedApplication openURL:url options:@{UIApplicationOpenURLOptionsSourceApplicationKey : @(YES)} completionHandler:nil];
          } else {
              [UIApplication.sharedApplication openURL:url];
          }
      }
  } else {
    result(FlutterMethodNotImplemented);
  }
}

@end
