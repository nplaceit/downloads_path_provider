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
  if ([call.method isEqualToString:@"getDownloadsDirectory"]) {
    result([self getDownloadsDirectory]);
  } else {
    result(FlutterMethodNotImplemented);
  }
}

- (NSString*)getDownloadsDirectory {
  NSFileManager* manager = [NSFileManager defaultManager];
  NSArray<NSURL*>* urls = [manager URLsForDirectory:NSDownloadsDirectory inDomains:NSUserDomainMask];
  if ([urls count] >= 1) {
    NSURL* url = urls[0];
    return url.absoluteString;
  }
  return nil;
}

@end
