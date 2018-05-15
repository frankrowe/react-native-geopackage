
#import "RNGeoPackage.h"
#import <React/RCTLog.h>

@implementation RNGeoPackage

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(open:(NSString *)filePath)
{
  RCTLogInfo(@"Open geopackage at %@", filePath);
}

@end
  
