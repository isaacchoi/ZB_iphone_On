//
//  website.h
//  final project
//
//  Created by sang tang on 11/9/13.
//  Copyright (c) 2013 cs m117. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface website : NSObject
//@property (strong,nonatomic)NSURLRequest *theRequest;

-(BOOL)thisNodeId:(NSString *)nodeId changeMessage:(NSString *)message;
-(NSArray *)retrieveMessage:(NSURL *)URL;

@end
