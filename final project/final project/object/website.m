//
//  website.m
//  final project
//
//  Created by sang tang on 11/9/13.
//  Copyright (c) 2013 cs m117. All rights reserved.
//

#import "website.h"

@implementation website

-(NSMutableArray *)oddArray:(NSArray *)oldArray
{
    NSUInteger newArraySize = [oldArray count]/2;
    NSMutableArray *newArray = [[NSMutableArray alloc] initWithCapacity:newArraySize];
    for (NSUInteger i = 0; i < newArraySize; i++) {
        newArray[i] = oldArray[2*i+1];
    }
    return newArray;
}

-(NSMutableArray *)extractArrayContent:(NSArray *)oldArray
{
    NSUInteger newArraySize = 2;
    NSMutableArray *newArray = [[NSMutableArray alloc] initWithCapacity:newArraySize];
    for (NSUInteger i = 0; i < [oldArray count]; i++) {
        if ([oldArray[i] isEqualToString:@"H"] || [oldArray[i] isEqualToString:@"C"]) {
            i++;
            [newArray addObject:oldArray[i]];
        }
    }
    return newArray;
}

-(BOOL)thisNodeId:(NSString *)nodeId changeMessage:(NSString *)message
{
    NSString *newURL = @"http://www.knowplace.cc/mydata?action=changeStatus&node_id=";
    newURL = [[[newURL stringByAppendingString:nodeId] stringByAppendingString:@"&new_current_value="] stringByAppendingString:message];
    
    NSURLRequest *theRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:newURL]];
    NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
    return true;
}

-(NSArray *)retrieveMessage:(NSURL *)URL
{
    NSError *error;
    NSString *stringFromFileAtURL = [[NSString alloc]
                                     initWithContentsOfURL:URL
                                     encoding:NSUTF8StringEncoding
                                     error:&error];
    
    NSArray *component = [stringFromFileAtURL componentsSeparatedByString:@"{" ];
    NSMutableArray *temp = [[NSMutableArray alloc] initWithArray:component];
    [temp removeObject:[temp firstObject]];
    [temp removeObject:[temp firstObject]];
    

    NSUInteger count = [temp count];
    for (NSUInteger i = 0; i < count; i++) {
        NSArray *newArray = [temp[i] componentsSeparatedByString:@"\""];
        temp[i] = [self extractArrayContent:[self oddArray:newArray]];
    }
    
    for (id obj in temp) {
        for (id obj2 in obj) {
            NSLog(obj2);
        }
    }
    return component = temp;
}

@end
