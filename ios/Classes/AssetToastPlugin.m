#import "AssetToastPlugin.h"
#if __has_include(<asset_toast/asset_toast-Swift.h>)
#import <asset_toast/asset_toast-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "asset_toast-Swift.h"
#endif

@implementation AssetToastPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftAssetToastPlugin registerWithRegistrar:registrar];
}
@end
