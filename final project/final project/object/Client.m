//
//  Client.m
//  final project
//
//  Created by sang tang on 11/9/13.
//  Copyright (c) 2013 cs m117. All rights reserved.
//

#import "Client.h"

@implementation Client


-(NSString *)name
{
    if (!_name) _name = [[NSString alloc] init];
    return _name;
}

-(NSArray *)message
{
    if (!_message) _message = [[NSMutableArray alloc] init];
    return _message;
}

-(NSString *)macAddress
{
    if (!_macAddress) _macAddress = [[NSString alloc] init];
    return _macAddress;
}

-(void)addClientMacAddress:(NSString *)macADdress clientName:(NSString *)name clientMessage:(NSString*)message
{
    self.name = name;
    self.macAddress = macADdress;
    [self.message insertObject:message atIndex:0];
}

-(void)insertMessage:(NSString *)newMessage
{
    [self.message insertObject:newMessage atIndex:0];
}

-(void)removeMessageAtIndexes:(NSUInteger)indexes
{
    [self.message removeObjectAtIndex:indexes];
}



@end
