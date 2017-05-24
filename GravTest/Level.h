//
//  Level.h
//  GravTest
//
//  Created by mac06 on 09/07/2014.
//  Copyright (c) 2014  All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Level : NSObject {
    NSInteger levelID;
}

@property(nonatomic, retain) NSMutableArray *levels;
@property(nonatomic, readwrite) NSInteger levelID;

@end
