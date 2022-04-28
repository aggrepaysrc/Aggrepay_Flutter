#import "AggrepayFlutterPlugin.h"
#if __has_include(<aggrepay_flutter/aggrepay_flutter-Swift.h>)
#import <aggrepay_flutter/aggrepay_flutter-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "aggrepay_flutter-Swift.h"
#endif

@implementation AggrepayFlutterPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftAggrepayFlutterPlugin registerWithRegistrar:registrar];
}
@end
