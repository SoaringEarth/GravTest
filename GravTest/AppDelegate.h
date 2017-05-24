//
//  AppDelegate.h
//  GravTest
//
//  Created by mac06 on 12/06/2014.
//  Copyright (c) 2014  All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LevelParser.h"

@class LevelParser;

@interface AppDelegate : UIResponder <UIApplicationDelegate> {
    LevelParser *levelParser;
    NSMutableArray *levels;
}

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) NSMutableArray *levels;


@end
