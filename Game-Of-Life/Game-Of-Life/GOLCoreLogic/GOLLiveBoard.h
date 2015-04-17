//
// Created by Bartlomiej Guminiak on 17/04/15.
// Copyright (c) 2015 Bartlomiej Guminiak. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface GOLLiveBoard : NSObject

- (instancetype)initWithAliveCells:(NSArray *)aliveCells;

@property (nonatomic, strong, readonly) NSArray *aliveCells;

- (void)tick;

@end