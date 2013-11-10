//
//  clientList.h
//  final project
//
//  Created by sang tang on 11/9/13.
//  Copyright (c) 2013 cs m117. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Client.h"

@interface clientList : NSObject

-(void)addClient:(Client *)client;

-(Client *)findClient:(NSString *)clientMacAddress;
-(void)clientLog;
@end
