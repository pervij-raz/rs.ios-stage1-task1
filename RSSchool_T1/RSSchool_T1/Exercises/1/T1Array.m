#import "T1Array.h"

@implementation T1Array

// Complete the following fuction
- (NSArray *)convertToHappy:(NSArray *)sadArray {
    NSMutableArray *array = [[NSMutableArray alloc]initWithArray:sadArray];
    if (array.count == 0) {
        return array;
    } else {
        while (![self checks: array]) {
            for (int i = 1; i < array.count - 1; i++) {
                int plus = i + 1;
                int min = i - 1;
                if ([array[i] intValue] > ([array[plus] intValue] + [array[min] intValue])) {
                    [array removeObjectAtIndex:i];
                    continue;
                }
            }
        }
    }
    return array;
}

-(BOOL *)checks:(NSArray *)array {
    BOOL checks = YES;
    for (int i = 1; i < array.count - 1; i++) {
        int plus = i + 1;
        int min = i - 1;
        if ([array[i] intValue] > ([array[plus] intValue] + [array[min] intValue])) {
            checks = checks && NO;
        }
    }
    return checks;
}


@end
