#import "DownloadsPathProviderPlugin.h"

@implementation DownloadsPathProviderPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"downloads_path_provider"
            binaryMessenger:[registrar messenger]];
  DownloadsPathProviderPlugin* instance = [[DownloadsPathProviderPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  result(FlutterMethodNotImplemented);
}

@end
