//
// Created by Bartlomiej Guminiak on 17/04/15.
// Copyright (c) 2015 Bartlomiej Guminiak. All rights reserved.
//

#import "GOLCell.h"

@implementation GOLCell

- (instancetype)initWithCoordinatesX:(NSNumber *)x
                                   y:(NSNumber *)y
{
    self = [super init];
    if (!self) return nil;

    _x = x;
    _y = y;

    return self;
}

@end