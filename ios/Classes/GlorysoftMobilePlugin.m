#import "GlorysoftMobilePlugin.h"
#if __has_include(<glorysoft_mobile_plugin/glorysoft_mobile_plugin-Swift.h>)
#import <glorysoft_mobile_plugin/glorysoft_mobile_plugin-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "glorysoft_mobile_plugin-Swift.h"
#endif

@implementation GlorysoftMobilePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftGlorysoftMobilePlugin registerWithRegistrar:registrar];
}
@end
