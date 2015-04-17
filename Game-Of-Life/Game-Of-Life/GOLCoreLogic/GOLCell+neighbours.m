//
//  GOLCell+neighbours.m
//  Game-Of-Life
//
//  Created by Bartlomiej Guminiak on 17/04/15.
//  Copyright (c) 2015 Bartlomiej Guminiak. All rights reserved.
//

#import "GOLCell+neighbours.h"
#import "NSString+coordinate.h"

@implementation GOLCell (neighbours)

- (NSDictionary *)getNeighbourDeadCells
{
    NSMutableDictionary *neighbourDict = [NSMutableDictionary new];
    BOOL deadState = NO;

    [self addObjectAtCoordinateX:@(self.x.integerValue - 1)
                               y:@(self.y.integerValue - 1)
                          toDict:neighbourDict];

    [self addObjectAtCoordinateX:@(self.x.integerValue)
                               y:@(self.y.integerValue - 1)
                          toDict:neighbourDict];

    [self addObjectAtCoordinateX:@(self.x.integerValue + 1)
                               y:@(self.y.integerValue - 1)
                          toDict:neighbourDict];

    [self addObjectAtCoordinateX:@(self.x.integerValue - 1)
                               y:@(self.y.integerValue)
                          toDict:neighbourDict];

    [self addObjectAtCoordinateX:@(self.x.integerValue + 1)
                               y:@(self.y.integerValue)
                          toDict:neighbourDict];

    [self addObjectAtCoordinateX:@(self.x.integerValue - 1)
                               y:@(self.y.integerValue + 1)
                          toDict:neighbourDict];

    [self addObjectAtCoordinateX:@(self.x.integerValue - 1)
                               y:@(self.y.integerValue + 1)
                          toDict:neighbourDict];

    [self addObjectAtCoordinateX:@(self.x.integerValue - 1)
                               y:@(self.y.integerValue + 1)
                          toDict:neighbourDict];

    return neighbourDict;
}

- (GOLCell *)deadCellAtX:(NSNumber *)x y:(NSNumber *)y
{
    return [[GOLCell alloc] initWithCoordinatesX:x
                                               y:y
                                     statusAlive:NO];
}


- (void)addObjectAtCoordinateX:(NSNumber *)x y:(NSNumber *)y toDict:(NSMutableDictionary *)dict
{
    [dict setObject:[self deadCellAtX:x y:y] forKey:[NSString stringFromCoordinateX:x y:y]];
}

- (NSUInteger)aliveNeighbourCountFromDict:(NSDictionary *)dict
{
    NSUInteger count = 0;
    GOLCell *cell;
    cell = [dict objectForKey:[NSString stringFromCoordinateX:@(self.x.integerValue - 1) y:@(self.y.integerValue - 1)]];
    count += cell.isAlive ? 1 : 0;

    cell = [dict objectForKey:[NSString stringFromCoordinateX:@(self.x.integerValue) y:@(self.y.integerValue - 1)]];
    count += cell.isAlive ? 1 : 0;

    cell = [dict objectForKey:[NSString stringFromCoordinateX:@(self.x.integerValue + 1) y:@(self.y.integerValue - 1)]];
    count += cell.isAlive ? 1 : 0;

    cell = [dict objectForKey:[NSString stringFromCoordinateX:@(self.x.integerValue - 1) y:@(self.y.integerValue)]];
    count += cell.isAlive ? 1 : 0;

    cell = [dict objectForKey:[NSString stringFromCoordinateX:@(self.x.integerValue + 1) y:@(self.y.integerValue)]];
    count += cell.isAlive ? 1 : 0;

    cell = [dict objectForKey:[NSString stringFromCoordinateX:@(self.x.integerValue - 1) y:@(self.y.integerValue + 1)]];
    count += cell.isAlive ? 1 : 0;

    cell = [dict objectForKey:[NSString stringFromCoordinateX:@(self.x.integerValue - 1) y:@(self.y.integerValue + 1)]];
    count += cell.isAlive ? 1 : 0;

    cell = [dict objectForKey:[NSString stringFromCoordinateX:@(self.x.integerValue - 1) y:@(self.y.integerValue + 1)]];
    count += cell.isAlive ? 1 : 0;

    return count;
}

@end
