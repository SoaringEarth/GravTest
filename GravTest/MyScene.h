//
//  MyScene.h
//  GravTest
//

//  Copyright (c) 2014  All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface MyScene : SKScene <SKPhysicsContactDelegate> {
    SKShapeNode *path;
    
    SKSpriteNode *sun;

    SKSpriteNode *jupiter;
    SKSpriteNode *saturn;

    SKSpriteNode *uranus;
    SKSpriteNode *neptune;
    
    SKSpriteNode *earth;
    SKSpriteNode *moon;
}

@end
