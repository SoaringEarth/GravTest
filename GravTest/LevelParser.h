//
//  LevelParser.h
//  GravTest
//
//  Created by mac06 on 09/07/2014.
//  Copyright (c) 2014  All rights reserved.
//

#import <Foundation/Foundation.h>

@class Level, AppDelegate;

@interface LevelParser : NSObject <NSXMLParserDelegate> {
    AppDelegate *appDelegate;
    Level *level;
    
    NSMutableString *curElem;
}

- (LevelParser*) initXMLParser;

+ (void)loadLevels;

@end
