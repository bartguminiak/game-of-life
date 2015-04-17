//
//  ViewController.m
//  Game-Of-Life
//
//  Created by Bartlomiej Guminiak on 17/04/15.
//  Copyright (c) 2015 Bartlomiej Guminiak. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self drawBoardWithGrid];
}

#pragma mark - Draw board

- (void)drawBoardWithGrid
{
    CGFloat dimensionSingleCell = self.view.frame.size.width / grid_x;
    for (int y = 0; y < grid_y; y++) {
        for (int x = 0; x < grid_x; x++) {
            CGRect rect = CGRectMake(x * dimensionSingleCell, y * dimensionSingleCell, dimensionSingleCell, dimensionSingleCell);
            [self.view addSubview:[self viewWithRect:rect]];
        }
    }
}

#pragma mark - Create view with rect

- (UIView *)viewWithRect:(CGRect)rect
{
    UIView *view = [[UIView alloc] initWithFrame:rect];
    UIView *leftBorder = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [self borderWidth], rect.size.height)];
    UIView *topBorder = [[UIView alloc] initWithFrame:CGRectMake(0, 0, rect.size.width, [self borderWidth])];
    UIView *rightBorder = [[UIView alloc] initWithFrame:CGRectMake(rect.size.width - [self borderWidth], 0, .5f, rect.size.height)];
    UIView *bottomBorder = [[UIView alloc] initWithFrame:CGRectMake(0, rect.size.width - [self borderWidth], rect.size.width, [self borderWidth])];
    
    leftBorder.backgroundColor = [self borderColor];
    topBorder.backgroundColor = [self borderColor];
    rightBorder.backgroundColor = [self borderColor];
    bottomBorder.backgroundColor = [self borderColor];
    
    [view addSubview:leftBorder];
    [view addSubview:topBorder];
    [view addSubview:rightBorder];
    [view addSubview:bottomBorder];
    return view;
}

- (UIColor *)borderColor
{
    return [UIColor grayColor];
}

- (CGFloat)borderWidth
{
    return .5f;
}
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
