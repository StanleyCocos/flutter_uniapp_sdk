#import "FlutterUniappSdkPlugin.h"
#import "DCUniMP.h"

@implementation FlutterUniappSdkPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"flutter_uniapp_sdk"
            binaryMessenger:[registrar messenger]];
  FlutterUniappSdkPlugin* instance = [[FlutterUniappSdkPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
    [registrar addApplicationDelegate:instance];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"getPlatformVersion" isEqualToString:call.method]) {
    result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
  } else {
    result(FlutterMethodNotImplemented);
  }
}


#pragma mark - 生命周期
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    // 配置参数
    NSMutableDictionary *options = [NSMutableDictionary dictionaryWithDictionary:launchOptions];
    [options setObject:[NSNumber numberWithBool: YES] forKey:@"debug"];
    [DCUniMPSDKEngine initSDKEnvironmentWithLaunchOptions:options];
    return YES;
}

@end
