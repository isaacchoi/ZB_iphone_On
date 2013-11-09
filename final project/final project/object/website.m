//
//  website.m
//  final project
//
//  Created by sang tang on 11/9/13.
//  Copyright (c) 2013 cs m117. All rights reserved.
//

#import "website.h"

@implementation website

-(void)newMacAddress:(NSString *)macAddress newName:(NSString *)name newMessage:(NSString *)message
{
    NSString *newURL = @"http://www.knowplace.cc/mydata?action=changeStatus&node_id=";
    newURL = [newURL stringByAppendingString:macAddress];
    newURL = [newURL stringByAppendingString:@"&new_current_value="];
    newURL = [newURL stringByAppendingString:message];
    NSLog(@"%@",newURL);
    NSURLRequest *theRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:newURL]
                                    cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
     NSURLConnection *theConnection=[[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
    
}

-(void)changeMessage:(NSString *)macAddress
{}

-(NSString *)retrieveMessage:(NSString *)macAddress
{
    return nil;
}

@end
