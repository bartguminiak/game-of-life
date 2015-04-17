//
// Created by Bartlomiej Guminiak on 17/04/15.
// Copyright (c) 2015 Bartlomiej Guminiak. All rights reserved.
//

#import "GOLSpecHelper.h"
#import "GOLCell.h"
#import "GOLCell+comparison.h"
#import "NSString+coordinate.h"

SpecBegin(GOLCell)

    describe(@"GOLCell tests", ^{});


    __block GOLCell *liveCell;
    it(@"creation", ^{
        liveCell = [GOLCell new];
        expect(liveCell).notTo.beNil();
    });

    it(@"creation with coordinates", ^{
        liveCell = [[GOLCell alloc] initWithCoordinatesX:@5 y:@6 statusAlive:YES];
        expect(liveCell.x).to.equal(@5);
        expect(liveCell.y).to.equal(@6);
    });

    it(@"cell comparison check are different", ^{
        liveCell = [[GOLCell alloc] initWithCoordinatesX:@3 y:@4 statusAlive:YES];
        GOLCell *otherAliveCell = [[GOLCell alloc] initWithCoordinatesX:@4 y:@5 statusAlive:YES];

        BOOL areDifferent = [liveCell isEqualToOtherCell:otherAliveCell];
        expect(areDifferent).to.beFalsy();
    });

    it(@"cell comparison are the same", ^{
        liveCell = [[GOLCell alloc] initWithCoordinatesX:@3 y:@4 statusAlive:YES];
        GOLCell *otherAliveCell = [[GOLCell alloc] initWithCoordinatesX:@3 y:@4 statusAlive:YES];

        BOOL areDifferent = [liveCell isEqualToOtherCell:otherAliveCell];
        expect(areDifferent).to.beTruthy();
    });


SpecEnd