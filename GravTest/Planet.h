//
//  Planet.h
//  GravTest
//
//  Created by mac06 on 26/06/2014.
//  Copyright (c) 2014  All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface Planet : SKSpriteNode {
@public
    float gravity;
    float gravity_radius;
    float mass;
    
@private
    
}

- (id)initWithImageNamed:(NSString *)imgName withSize:(CGSize)size withName:(NSString *)name withGravity:(float)planetGravity GravityRadius:(float)radius andMass:(float)planetMass;

@end
