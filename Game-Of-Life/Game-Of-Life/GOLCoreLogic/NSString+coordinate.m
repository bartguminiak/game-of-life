//
// Created by Bartlomiej Guminiak on 17/04/15.
// Copyright (c) 2015 Bartlomiej Guminiak. All rights reserved.
//

#import "NSString+coordinate.h"


@implementation NSString (coordinate)

+ (NSString *)stringFromCoordinateX:(NSNumber *)x y:(NSNumber *)y
{
    return [NSString stringWithFormat:@"%d,%d", x.integerValue, y.integerValue];
}

@end