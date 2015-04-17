//
//  GOLCell+comparison.h
//  Game-Of-Life
//
//  Created by Bartlomiej Guminiak on 17/04/15.
//  Copyright (c) 2015 Bartlomiej Guminiak. All rights reserved.
//

#import "GOLCell.h"

@interface GOLCell (comparison)

- (BOOL)isEqualToOtherCell:(GOLCell *)cell;

@end
