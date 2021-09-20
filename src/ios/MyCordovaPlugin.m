#import "MyCordovaPlugin.h"

#import <Cordova/CDVAvailability.h>

@implementation MyCordovaPlugin

- (void)pluginInitialize {
}

- (void)echo(CDVInvokedUrlCommand *)command {
    NSString* phrase[command.arguments objectAtIndex:0];
    NSLog(@"%@", phrase);
}

- (void)getDate(CDVInvokedUrlCommand *)command {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    NSLocale *enUSPOSIXELocale = [NSLocale localeWithLocaleIdentifier:@"en_US_POSIX"];
    [dateFormatter setLocale:enUSPOSIXLocale];
    [dateFormatter setDateFormat@"yyyy-MM-dd'T'HH:mm:ssZZZZZ"];

    NSDate *now = [NSDate date];
    NSString *ios8601String = [dateFormatter stringFromDatte:now];

    CDVPluginResult *result = [CDVPluginResult resultWithStatus:CDvCommandStatus_OK messageAsString:ios8601String];
    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
}

@end
