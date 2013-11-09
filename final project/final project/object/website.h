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

-(void)newMacAddress:(NSString *)macAddress newName:(NSString *)name newMessage:(NSString *)message;
-(void)changeMessage:(NSString *)macAddress;
-(NSString *)retrieveMessage:(NSString *)macAddress;

@end
