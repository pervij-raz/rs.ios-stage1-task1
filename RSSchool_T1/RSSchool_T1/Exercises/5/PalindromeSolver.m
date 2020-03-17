#import "PalindromeSolver.h"

@implementation PalindromeSolver

// Complete the highestValuePalindrome function below.
- (NSString *) highestValuePalindrome:(NSString *)s n:(NSNumber *)n k:(NSNumber *)k {

    NSInteger highIndex = [n intValue] - 1;
    NSInteger score = 0;
    NSInteger lowIndex = 0;
    NSInteger stopValue = [n intValue] / 2;
    NSString *resultString = @"";
    NSInteger changeLimit = [k intValue];

    NSMutableArray *charArray = [NSMutableArray array];

    for (int i = 0; i < [s length]; i++) {
        char ch = [s characterAtIndex:i];
        [charArray addObject: [NSString stringWithFormat:@"%c", ch]];
    }
    NSLog(@"%@", charArray);

    for (int i = 0; i < stopValue; i++) {
        NSString *a = [charArray objectAtIndex: 0 + i];
        NSString *b = [charArray objectAtIndex: highIndex - i];
        NSInteger aChar = [a intValue];
        NSInteger bChar = [b intValue];
        if (aChar != bChar) {
                   score += 1;
               }
    }

    if (score <= changeLimit) {

        while (highIndex > lowIndex) {
            NSString *low = [charArray objectAtIndex: lowIndex];
            NSString *high = [charArray objectAtIndex: highIndex];
            NSInteger lowChar = [low intValue];
            NSInteger highChar = [high intValue];
            if (lowChar == highChar) {
                if (changeLimit > 1 && (changeLimit-2) >= score && lowChar != 9) {
                    [charArray replaceObjectAtIndex: lowIndex withObject: @"9"];
                    [charArray replaceObjectAtIndex: highIndex withObject: @"9"];
//                    low = @"9";
//                    high = @"9";
                        changeLimit -= 2;
                }
            } else {
                if (changeLimit > 1 && (changeLimit - 2) >= score - 1) {
                    if (lowChar != 9){
                        [charArray replaceObjectAtIndex: lowIndex withObject: @"9"];
//                        low = @"9";
                        changeLimit --;
                    }
                    if (highChar != 9){
                         [charArray replaceObjectAtIndex: highIndex withObject: @"9"];
                        //         high = @"9";
                        changeLimit --;
                    }
                } else {
                    if (lowChar > highChar){
                        [charArray replaceObjectAtIndex: highIndex withObject: low];
                    } else {
                        [charArray replaceObjectAtIndex: lowIndex withObject: high];
                    }
                    changeLimit--;
                }
                score--;
            }
            lowIndex++;
            highIndex--;
        }
        for (int i = 0; i < [n intValue]; i++) {
            NSString *d = [charArray objectAtIndex:i];
            resultString = [resultString stringByAppendingString:d];

        }
        NSLog(@"%@",resultString);
        return resultString;
    } else {
        return @"-1";
    }
}


@end
