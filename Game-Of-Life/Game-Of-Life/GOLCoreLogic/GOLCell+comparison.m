//
//  GOLCell+comparison.m
//  Game-Of-Life
//
//  Created by Bartlomiej Guminiak on 17/04/15.
//  Copyright (c) 2015 Bartlomiej Guminiak. All rights reserved.
//

#import "GOLCell+comparison.h"

@implementation GOLCell (comparison)

- (BOOL)isEqualToOtherCell:(GOLCell *)cell
{
    return [self.x isEqualToNumber:cell.x] && [self.y isEqualToNumber:cell.y];
}

@end
