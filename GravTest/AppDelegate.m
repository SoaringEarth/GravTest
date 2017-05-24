//
//  AppDelegate.m
//  GravTest
//
//  Created by mac06 on 12/06/2014.
//  Copyright (c) 2014  All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate
@synthesize levels;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSString *dataPath = [[NSBundle mainBundle] pathForResource:@"levels" ofType:@"xml"];
    NSData *xmlData = [[NSData alloc] initWithContentsOfFile:dataPath];
    NSXMLParser *xmlparser = [[NSXMLParser alloc] initWithData:xmlData];
    
    LevelParser *parser = [[LevelParser alloc] initXMLParser];
    
    [xmlparser setDelegate:parser];
    
//    BOOL success = [xmlparser parse];
    
//    if(success){
//        NSLog(@"No Errors");
//    }
//    else{
//        NSLog(@"Error Error Error!!!");
//    }
    
    // Override point for customization after application launch.
    return YES;
}

@end
