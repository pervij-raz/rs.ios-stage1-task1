#import "Parser.h"

@implementation Parser

// Complete the parseString function below.
- (NSArray <NSString*>*)parseString:(NSString*)string {
    
    NSMutableArray *arrayFromString = [NSMutableArray array];
    for (int i = 0; i < [string length]; i++) {
        [arrayFromString addObject:[NSString stringWithFormat:@"%C", [string characterAtIndex:i]]];
    }
    
        NSMutableArray *resultString = [NSMutableArray array];
    
    for (int key = 0; key < arrayFromString.count; key++) {
        if ([arrayFromString[key]  isEqual: @"["]) {
            NSArray *partOfArray = [arrayFromString subarrayWithRange:NSMakeRange(key, arrayFromString.count - key)];
             for (int index = 0; index < partOfArray.count; index++) {
                 if ([partOfArray[index]  isEqual: @"]"]) {
                        if (key + 1 < index + key) {
                        NSArray *arrayFromSubstring = [arrayFromString subarrayWithRange:NSMakeRange(key + 1, index - 1)];
                            [resultString addObject: [arrayFromSubstring componentsJoinedByString:@""]];
                        }}
                }
        } else if ([arrayFromString[key]  isEqual: @"("]) {
                NSArray *partOfArray = [arrayFromString subarrayWithRange:NSMakeRange(key, arrayFromString.count - key)];
               for (int index = 0; index < partOfArray.count; index++) {
                    if ([partOfArray[index]  isEqual: @")"]) {
                        if (key + 1 < index + key) {
                        NSArray *arrayFromSubstring = [arrayFromString subarrayWithRange:NSMakeRange(key + 1, index - 1)];
                        [resultString addObject: [arrayFromSubstring componentsJoinedByString:@""]];
                    }
                    }
                }
        } else if ([arrayFromString[key]  isEqual: @"<"]) {
                NSArray *partOfArray = [arrayFromString subarrayWithRange:NSMakeRange(key, arrayFromString.count - key)];
                for (int index = 0; index < partOfArray.count; index++) {
                    if ([partOfArray[index]  isEqual: @">"]) {
                        if (key + 1 < index + key) {
                        NSArray *arrayFromSubstring = [arrayFromString subarrayWithRange:NSMakeRange(key + 1, index - 1)];
                        [resultString addObject: [arrayFromSubstring componentsJoinedByString:@""]];
                        }}
                }
        }
    }
    return resultString;
}

@end
