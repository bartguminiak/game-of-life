//
// Created by Bartlomiej Guminiak on 17/04/15.
// Copyright (c) 2015 Bartlomiej Guminiak. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface GOLCell : NSObject

- (instancetype)initWithCoordinatesX:(NSNumber *)x
                                   y:(NSNumber *)y
                         statusAlive:(BOOL)isAlive;

@property (nonatomic) BOOL isAlive;
@property (nonatomic) NSNumber *x;
@property (nonatomic) NSNumber *y;

@end