#import <React/RCTBridgeModule.h>
#import "GPKGGeoPackageManager.h"

@interface RNGeoPackage : NSObject <RCTBridgeModule> {
  GPKGGeoPackageManager *manager;
}

@end
  
