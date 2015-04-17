//
// Created by Bartlomiej Guminiak on 17/04/15.
// Copyright (c) 2015 Bartlomiej Guminiak. All rights reserved.
//

#import "GOLLiveBoard.h"
#import "GOLCell.h"
#import "GOLCell+neighbours.h"
#import "NSString+coordinate.h"

@interface GOLLiveBoard()

@property (nonatomic, strong, readwrite) NSArray *aliveCells;
@property (nonatomic, strong) __block NSMutableDictionary *cellsWithNeighbours;

@end

@implementation GOLLiveBoard

- (instancetype)initWithAliveCells:(NSArray *)aliveCells
{
    self = [super init];
    if (!self) return nil;

    _aliveCells = [[NSArray alloc] initWithArray:aliveCells];

    return self;
}

- (void)tick
{
    self.cellsWithNeighbours = [NSMutableDictionary new];
    [self addDeadNeighbours];
    [self addAliveCells];
    [self iterateLife];
}

#pragma mark - Cell operations

- (void)addDeadNeighbours
{
    NSMutableDictionary *neighbourCells = [NSMutableDictionary new];
    [self.aliveCells enumerateObjectsUsingBlock:^(GOLCell *aliveCell, NSUInteger idx, BOOL *stop) {
        [neighbourCells addEntriesFromDictionary:[aliveCell getNeighbourDeadCells]];
    }];

    [self.cellsWithNeighbours addEntriesFromDictionary:neighbourCells];
}

- (void)addAliveCells
{
    NSMutableDictionary *aliveCells = [NSMutableDictionary new];
    [self.aliveCells enumerateObjectsUsingBlock:^(GOLCell *aliveCell, NSUInteger idx, BOOL *stop) {
        [aliveCells setObject:aliveCell forKey:[NSString stringFromCoordinateX:aliveCell.x y:aliveCell.y]];
    }];

    [self.cellsWithNeighbours addEntriesFromDictionary:aliveCells];
}

- (void)iterateLife
{
    [self.cellsWithNeighbours enumerateKeysAndObjectsUsingBlock:^(NSString *key, GOLCell *cell, BOOL *stop) {
        NSUInteger neighbourCount = [cell aliveNeighbourCountFromDict:self.cellsWithNeighbours];
        if ([cell isAlive]) {
            if (neighbourCount != 2 && neighbourCount != 3) {
                [cell setIsAlive:NO];
            }
        } else {
            if (neighbourCount == 3) {
                [cell setIsAlive:YES];
            }
        }
    }];
}

- (void)updateAliveArray
{
    NSMutableArray *afterIteration = [NSMutableArray new];
    [self.cellsWithNeighbours enumerateKeysAndObjectsUsingBlock:^(id key, GOLCell *cell, BOOL *stop) {
        [afterIteration addObject:cell];
    }];

    self.aliveCells = [[NSArray alloc] initWithArray:afterIteration];
}


@end