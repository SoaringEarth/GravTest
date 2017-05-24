//
//  Planet.m
//  GravTest
//
//  Created by mac06 on 26/06/2014.
//  Copyright (c) 2014  All rights reserved.
//

#import "Planet.h"

@implementation Planet

- (id)initWithImageNamed:(NSString *)imgName withSize:(CGSize)spriteSize withName:(NSString *)spriteName withGravity:(float)planetGravity GravityRadius:(float)radius andMass:(float)planetMass {
    if ([super initWithImageNamed:imgName]) {
        self.size = spriteSize;
        self.name = spriteName;
        
        gravity = planetGravity;
        gravity_radius = radius;
        mass = planetMass;
    }
    
    return self;
}

@end
