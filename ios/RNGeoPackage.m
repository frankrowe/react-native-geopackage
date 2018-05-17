
#import "RNGeoPackage.h"
#import <React/RCTLog.h>
#import "GPKGGeoPackageFactory.h"
#import "GPKGMapShapeConverter.h"

NSString *const RNGeoPackageErrorDomain =
@"RNGeoPackageErrorDomain";

@implementation RNGeoPackage

- (id)init {
  self = [super init];
  if (self) {
    manager = [GPKGGeoPackageFactory getManager];
  }
  return self;
}

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(open:(NSString *)filePath
                  resolver:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject)
{
  RCTLogInfo(@"Open geopackage at %@", filePath);
  BOOL imported = [manager importGeoPackageFromPath:filePath];
  if (imported) {
    resolve(@"true");
  } else {
    NSError *err = [NSError errorWithDomain:RNGeoPackageErrorDomain
                                       code:-57
                                   userInfo:nil];
    reject(@"Error opening geopackage.", @"error", err);
  }
}

RCT_EXPORT_METHOD(query:(NSString *)filePath
                  resolver:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject)
{
  NSArray *databases = [manager databases];
  GPKGGeoPackage *geoPackage = [manager open:[databases objectAtIndex:0]];
  NSArray * features = [geoPackage getFeatureTables];
  NSString * featureTable = [features objectAtIndex:0];
  GPKGFeatureDao * featureDao = [geoPackage getFeatureDaoWithTableName:featureTable];
  GPKGMapShapeConverter *converter = [[GPKGMapShapeConverter alloc] initWithProjection:featureDao.projection];
  GPKGResultSet * featureResults = [featureDao queryForAll];
  @try {
    while([featureResults moveToNext]){
      GPKGFeatureRow * featureRow = [featureDao getFeatureRow:featureResults];
      GPKGGeometryData * geometryData = [featureRow getGeometry];
      WKBGeometry * geometry = geometryData.geometry;
      GPKGMapShape * shape = [converter toShapeWithGeometry:geometry];
    
    }
  }@finally {
    [featureResults close];
  }
}

@end
  
