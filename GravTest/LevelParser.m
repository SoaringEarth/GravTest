//
//  LevelParser.m
//  GravTest
//
//  Created by mac06 on 09/07/2014.
//  Copyright (c) 2014  All rights reserved.
//

#import "LevelParser.h"
#import "Level.h"
#import "AppDelegate.h"

@implementation LevelParser

- (LevelParser*) initXMLParser {
//    [super init];
    
    appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    return self;
}

+ (NSString *)dataFilePath:(BOOL)forSave {
    return [[NSBundle mainBundle] pathForResource:@"levels" ofType:@"xml"];
}

+ (void)loadLevels {
    NSString *filePath = [self dataFilePath:FALSE];
    NSData *xmlData = [[NSMutableData alloc] initWithContentsOfFile:filePath];
    
    NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithData:xmlData];
    
    if (xmlParser == nil) {
        NSLog(@"ERROR -- XML Data is NIL");
    }
    
    
    [xmlParser parse];
    
}

-(void) parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName attributes:(NSDictionary *)attributeDict
{
    if([elementName isEqualToString:@"LEVELS"]) {
        //Initialize the array.
        appDelegate.levels = [[NSMutableArray alloc] init];
    }
    else if([elementName isEqualToString:@"LEVEL"]) {
        
        //Initialize the level.
        level = [[Level alloc] init];
        
        //Extract the attribute here.
        level.levelID = [[attributeDict objectForKey:@"id"] integerValue];
        
        NSLog(@"Level id value :%li", (long)level.levelID);
    }
    
    NSLog(@"Processing Element: %@", elementName);
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    
    if(!curElem)
        curElem = [[NSMutableString alloc] initWithString:string];
    else
        [curElem appendString:string];
    
    NSLog(@"Processing Value: %@", curElem);
    
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    
    if([elementName isEqualToString:@"LEVELS"])
        return;
    
    if([elementName isEqualToString:@"LEVEL"]) {
        [appDelegate.levels addObject:level];
        
        level = nil;
    }
    else
        [level setValue:curElem forKey:elementName];
    
    curElem = nil;
}

@end
