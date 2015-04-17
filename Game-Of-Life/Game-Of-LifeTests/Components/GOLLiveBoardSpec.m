//
// Created by Bartlomiej Guminiak on 17/04/15.
// Copyright (c) 2015 Bartlomiej Guminiak. All rights reserved.
//

#import "GOLSpecHelper.h"
#import "GOLCell.h"
#import "GOLCell+comparison.h"
#import "GOLLiveBoard.h"
#import "NSString+coordinate.h"

SpecBegin(GOLLiveBoard)

    describe(@"GOLLiveBoard tests", ^{});

    __block GOLLiveBoard *liveBoard;

    it(@"creation", ^{
        liveBoard = [GOLLiveBoard new];

        expect(liveBoard).notTo.beNil();
    });

    it(@"creation with alive cells", ^{
        NSArray *aliveCells = @[[[GOLCell alloc] initWithCoordinatesX:@1 y:@1 statusAlive:YES],
                [[GOLCell alloc] initWithCoordinatesX:@2 y:@3 statusAlive:YES],
                [[GOLCell alloc] initWithCoordinatesX:@4 y:@8 statusAlive:YES],
                [[GOLCell alloc] initWithCoordinatesX:@-8 y:@-100 statusAlive:YES]];

        liveBoard = [[GOLLiveBoard alloc] initWithAliveCells:[aliveCells copy]];

        __block BOOL theSame = YES;
        [liveBoard.aliveCells enumerateObjectsUsingBlock:^(GOLCell *liveCell, NSUInteger idx, BOOL *stop) {

            GOLCell *otherLiveCell = aliveCells[idx];
            if (![otherLiveCell isEqualToOtherCell:liveCell]) {
                theSame = NO;
                *stop = YES;
            }

            expect(theSame).to.beTruthy();
        }];
    });

    it(@"make single cell die", ^{
        GOLCell *singleCell = [[GOLCell alloc] initWithCoordinatesX:@4 y:@5 statusAlive:YES];
        liveBoard = [[GOLLiveBoard alloc] initWithAliveCells:@[singleCell]];

        [liveBoard tick];

        expect(liveBoard.aliveCells).to.beEmpty();
    });

SpecEnd