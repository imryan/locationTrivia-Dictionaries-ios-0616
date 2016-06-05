//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    return YES;
}

- (NSString *)stringByTruncatingNameOfLocation:(NSDictionary *)location toLength:(NSUInteger)length {
    NSString *locationName = location[@"name"];
    
    if (length < locationName.length) {
        locationName = [locationName substringToIndex:length];
    }
    
    return locationName;
}

- (NSDictionary *)dictionaryForLocationWithName:(NSString *)name latitude:(CGFloat)latitude longitude:(CGFloat)longitude {
    // Given that the values being passed in are != nil...
    NSDictionary *location = @{
                               @"name"      : name,
                               @"latitude"  : @(latitude),
                               @"longitude" : @(longitude)
                              };
    return location;
}

- (NSArray *)namesOfLocations:(NSArray *)locations {
    NSMutableArray *locationNames = [NSMutableArray new];
    for (NSDictionary *location in locations) {
        [locationNames addObject:[location objectForKey:@"name"]];
    }
    
    return locationNames;
}

- (BOOL)dictionaryIsValidLocation:(NSDictionary *)dictionary {
    BOOL isValid = NO;
    
    NSDictionary *idealLocation = @{
                                    @"name"      : @"",
                                    @"latitude"  : @"",
                                    @"longitude" : @""
                                   };

    if ([[dictionary allKeys] isEqualToArray:[idealLocation allKeys]]) {
        isValid = YES;
    }
    
    return isValid;
}

- (NSDictionary *)locationNamed:(NSString *)name inLocations:(NSArray *)locations {
    NSDictionary *matchingDictionary = nil;
    for (NSDictionary *location in locations) {
        if ([[location objectForKey:@"name"] isEqualToString:name]) {
            matchingDictionary = [NSDictionary dictionaryWithDictionary:location];
        }
    }
    
    return matchingDictionary;
}

@end
