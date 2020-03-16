#import "BillCounter.h"

@implementation BillCounter

// Complete the following fuction
- (NSString*)compareResultForBill:(NSArray<NSNumber*>*)bill notIncludingElementWithIndex:(NSInteger)index withGivenSum:(NSNumber*)sum {
    NSMutableArray *resultArray = [bill mutableCopy];
    [resultArray removeObjectAtIndex: index];

    int i, result, value;
       result = 0;
       value = 0;

       for (i = 0; i < [resultArray count]; i++) {
           value = [[resultArray objectAtIndex: i] intValue];
           result += value;
       }

    result = result / 2;

    if (result != [sum intValue]) {
        result = [sum intValue] - result;
        NSLog(@"%d", result);
        NSString* string = [NSString stringWithFormat:@"%i", result];
        return string;
    } else {
        return @"Bon Appetit";
    }
}


@end
