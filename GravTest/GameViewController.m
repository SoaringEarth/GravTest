//
//  GameViewController.m
//  GravTest
//
//  Created by mac06 on 12/06/2014.
//  Copyright (c) 2014  All rights reserved.
//

#import "GameViewController.h"
#import "MyScene.h"
#import "LevelParser.h"

@implementation GameViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidLayoutSubviews {
    // Configure the view.
       
    SKView * skView = (SKView *)self.view;
    skView.showsFPS = YES;
    skView.showsNodeCount = YES;
    
    // Create and configure the scene.
    SKScene * scene = [MyScene sceneWithSize:skView.bounds.size];
    scene.scaleMode = SKSceneScaleModeAspectFill;
    
    // Present the scene.
    [skView presentScene:scene];
}

@end
