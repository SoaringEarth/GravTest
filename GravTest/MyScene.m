//
//  MyScene.m
//  GravTest
//
//  Created by mac06 on 12/06/2014.
//  Copyright (c) 2014  All rights reserved.
//

#import "MyScene.h"

@implementation MyScene

#define SUN_RADIUS 200
#define EARTH_RADIUS 100
#define GRAVITY 0.01

static const uint32_t playerCategory = 0x1 << 0;
static const uint32_t obstacleCategory = 0x1 << 1;

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */

        self.backgroundColor = [SKColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
        
        sun = [[SKSpriteNode alloc] initWithImageNamed:@"sun_sprite.png"];
        sun.size = CGSizeMake(100, 100);
        sun.position = CGPointMake(size.width * 0.5, size.height * 0.1);
        [sun setName:@"sun"];
        [sun setPhysicsBody:[SKPhysicsBody bodyWithCircleOfRadius:42]];
        [sun.physicsBody setMass:1980000];
        [sun.physicsBody setDynamic:NO];
        [sun.physicsBody setAffectedByGravity:NO];
        sun.physicsBody.categoryBitMask = obstacleCategory;
        sun.physicsBody.collisionBitMask = playerCategory | obstacleCategory;
        sun.physicsBody.contactTestBitMask = playerCategory;
        [self addChild:sun];
        
        
        jupiter = [[SKSpriteNode alloc] initWithImageNamed:@"jupiter_sprite.png"];
        jupiter.size = CGSizeMake(80, 80);
        jupiter.position = CGPointMake(size.width * 0.5, size.height * 0.3);
        [jupiter setPhysicsBody:[SKPhysicsBody bodyWithCircleOfRadius:40]];
        [jupiter.physicsBody setMass:1980000];
        [jupiter.physicsBody setDynamic:NO];
        [jupiter.physicsBody setAffectedByGravity:NO];
        [jupiter setName:@"jupiter"];
        jupiter.physicsBody.categoryBitMask = obstacleCategory;
        jupiter.physicsBody.collisionBitMask = playerCategory | obstacleCategory;
        jupiter.physicsBody.contactTestBitMask = playerCategory;
        [self addChild:jupiter];
        
        
        saturn = [[SKSpriteNode alloc] initWithImageNamed:@"saturn_sprite.png"];
        saturn.size = CGSizeMake(70, 70);
        saturn.position = CGPointMake(size.width * 0.5, size.height * 0.45);
        [saturn setPhysicsBody:[SKPhysicsBody bodyWithCircleOfRadius:20]];
        [saturn.physicsBody setMass:1980000];
        [saturn.physicsBody setDynamic:NO];
        [saturn.physicsBody setAffectedByGravity:NO];
        saturn.physicsBody.categoryBitMask = obstacleCategory;
        saturn.physicsBody.collisionBitMask = playerCategory | obstacleCategory;
        saturn.physicsBody.contactTestBitMask = playerCategory;
        [saturn setName:@"saturn"];
        [self addChild:saturn];
        
        
        moon = [[SKSpriteNode alloc] initWithImageNamed:@"moon.png"];
        moon.size = CGSizeMake(14, 14);
        moon.position = CGPointMake(size.width * 0.85, size.height * 0.4);
        [moon setPhysicsBody:[SKPhysicsBody bodyWithCircleOfRadius:7]];
        [[moon physicsBody] setDynamic:YES];
        [[moon physicsBody] setAffectedByGravity:NO];
        [moon.physicsBody setMass:73000];
        [moon setName:@"moon"];
        moon.physicsBody.categoryBitMask = playerCategory;
        moon.physicsBody.collisionBitMask = obstacleCategory;
        moon.physicsBody.contactTestBitMask = obstacleCategory;
        [self addChild:moon];
        [moon.physicsBody applyImpulse:CGVectorMake(-2000000.0, 2000000.0)];
        

        earth = [[SKSpriteNode alloc] initWithImageNamed:@"earth.png"];
        earth.size = CGSizeMake(24, 24);
        earth.position = CGPointMake(size.width * 0.5, size.height * 0.75);
        [earth setPhysicsBody:[SKPhysicsBody bodyWithCircleOfRadius:12]];
        [earth.physicsBody setMass:590000];
        [earth.physicsBody setDynamic:NO];
        [earth.physicsBody setAffectedByGravity:NO];
        [earth setName:@"earth"];
        earth.physicsBody.categoryBitMask = obstacleCategory;
        earth.physicsBody.collisionBitMask = playerCategory;
        earth.physicsBody.contactTestBitMask = playerCategory;
        [self addChild:earth];
        
        SKShapeNode *path1 = [[SKShapeNode alloc] init];
        path1.strokeColor = [UIColor whiteColor];
        path1.lineWidth = 2.0;
        // Create the path data.
        CGMutablePathRef cgPath = CGPathCreateMutable();
        CGPathAddEllipseInRect(cgPath, NULL, CGRectMake(10, size.height / 4, 300, 300));
        CGPathAddEllipseInRect(cgPath, NULL, CGRectMake(35, size.height / 4 + 25, 250, 250));
        CGPathAddEllipseInRect(cgPath, NULL, CGRectMake(60, size.height / 4 + 50, 200, 200));
        CGPathAddEllipseInRect(cgPath, NULL, CGRectMake(85, size.height / 4 + 75, 150, 150));
        CGPathAddEllipseInRect(cgPath, NULL, CGRectMake(110, size.height / 4 + 100, 100, 100));
        CGPathAddEllipseInRect(cgPath, NULL, CGRectMake(135, size.height / 4 + 125, 50, 50));
//        CGPathAddEllipseInRect(cgPath, NULL, CGRectMake(147, size.height / 4 + 137, 25, 25));
        
        // Now create the UIBezierPath object.
        UIBezierPath *aPath = [UIBezierPath bezierPath];
        aPath.CGPath = cgPath;
        aPath.usesEvenOddFillRule = YES;
        
        path1.path = aPath.CGPath;
//        [self addChild:path1];
        
        // After assigning it to the UIBezierPath object, you can release
        // your CGPathRef data type safely.
        CGPathRelease(cgPath);
        
        
        
        path = [[SKShapeNode alloc] init];
        [path setStrokeColor:[SKColor redColor]];
        [path setLineWidth:1.0];
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    

}

- (void)didBeginContact:(SKPhysicsContact *)contact {
    SKPhysicsBody *firstBody, *secondBody;
    
    if (contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask) {
        firstBody = contact.bodyA;
        secondBody = contact.bodyB;
    } else {
        firstBody = contact.bodyB;
        secondBody = contact.bodyA;
    }
    
    if (firstBody.categoryBitMask == playerCategory && secondBody.categoryBitMask == obstacleCategory) {
        NSLog(@"Collision");
    }
}

- (void)didSimulatePhysics {
//    [self drawOrbitPathForPlanet:moon];
}

- (void)drawOrbitPathForPlanet:(SKSpriteNode *)planet {
    CGMutablePathRef pathToDraw;
    pathToDraw = CGPathCreateMutable();
    CGPathMoveToPoint(pathToDraw, NULL, planet.position.x, planet.position.y);
    CGPathAddLineToPoint(pathToDraw, NULL, planet.position.x - 1, planet.position.y - 1);
    CGPathCloseSubpath(pathToDraw);
    
    path = [SKShapeNode node];
    path.path = pathToDraw;
    CGPathRelease(pathToDraw);
    [self addChild:path];
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
    if ([self checkForGravityRequiredFromPlanet:sun onPlanet:moon] == TRUE) {
//        NSLog(@"SUN PUll");
        [self calculateGravitationalPullFromPlanet:sun onPlanet:moon];
    } else {
//        NSLog(@"no Pull");
    }

    if ([self checkForGravityRequiredFromPlanet:earth onPlanet:moon] == TRUE) {
//        NSLog(@"EARTH PUll");
        [self calculateGravitationalPullFromPlanet:earth onPlanet:moon];
    } else {
//        NSLog(@"no Pull");
    }
    
//    http://stackoverflow.com/questions/13306596/simulate-the-gravitational-pull-of-a-star
}

- (BOOL)checkForGravityRequiredFromPlanet:(SKSpriteNode *)star onPlanet:(SKSpriteNode *)ship {
    float xDistance = star.position.x - ship.position.x;
    float yDistance = star.position.y - ship.position.y;
    float distance = sqrtf(powf(xDistance, 2) + powf(yDistance, 2));
    
    if (distance <= SUN_RADIUS) {
        return YES;
    } else {
        return NO;
    }
}

- (void)calculateGravitationalPullFromPlanet:(SKSpriteNode *)star onPlanet:(SKSpriteNode *)planet  {
    float xDistance = star.position.x - planet.position.x;
    float yDistance = star.position.y - planet.position.y;
    float distance = sqrtf(powf(xDistance, 2) + powf(yDistance, 2));
    float acceleration = GRAVITY * ((star.physicsBody.mass * planet.physicsBody.mass) / powf(distance, 2));
    
    float xAccel = acceleration * xDistance / distance;
    float yAccel = acceleration * yDistance / distance;
    
    float xSpeed = planet.physicsBody.velocity.dx;
    float ySpeed = planet.physicsBody.velocity.dy;

    
    xSpeed += xAccel;
    ySpeed += yAccel;

    [planet.physicsBody applyForce:CGVectorMake(xSpeed, ySpeed)];
}

@end
