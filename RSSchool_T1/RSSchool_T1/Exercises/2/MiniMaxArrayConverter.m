#import "MiniMaxArrayConverter.h"

@implementation MiniMaxArrayConverter

// Complete the convertFromArray function below.
- (NSArray<NSNumber*>*)convertFromArray:(NSArray<NSNumber*>*)array {
    
    NSArray* sortedArray = [array sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
      if ([obj1 integerValue] > [obj2 integerValue]) {
        return (NSComparisonResult)NSOrderedDescending;
      }

      if ([obj1 integerValue] < [obj2 integerValue]) {
        return (NSComparisonResult)NSOrderedAscending;
      }
      return (NSComparisonResult)NSOrderedSame;
    }];
    
    int min = 0;
    for (int i = 0; i < sortedArray.count - 1; i++) {
        min = min + [sortedArray[i] intValue];
    }
    
    int max = 0;
    
    for (int i = 1; i < sortedArray.count; i++) {
        max = max + [sortedArray[i] intValue];
    }
    
    NSMutableArray* result = [[NSMutableArray alloc] init];
    
    
    [result addObject:[NSNumber numberWithInt:((int)min)]];
    [result addObject:[NSNumber numberWithInt:((int)max)]];
    
    return result;
}

@end
