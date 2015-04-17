//
//  ViewController.h
//  Game-Of-Life
//
//  Created by Bartlomiej Guminiak on 17/04/15.
//  Copyright (c) 2015 Bartlomiej Guminiak. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

typedef struct {
    NSInteger x;
    NSInteger y;
} Coordinate;

- (NSInteger)indexForSubviewFromCoordinate:(Coordinate)coordinate;
- (void)makeCellAlive:(BOOL)alive atIndex:(NSInteger)index;

@end

