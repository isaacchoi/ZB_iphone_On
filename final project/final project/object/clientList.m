//
//  clientList.m
//  final project
//
//  Created by sang tang on 11/9/13.
//  Copyright (c) 2013 cs m117. All rights reserved.
//

#import "clientList.h"


@interface clientList()
@property (strong,nonatomic) NSMutableArray *clients;
@end

@implementation clientList

-(NSMutableArray *)clients
{
    if (!_clients) _clients = [[NSMutableArray alloc] init];
    return _clients;
}

-(void)addClient:(Client *)Client
{
    [self.clients addObject:Client];
}

-(Client *)findClient:(NSString *)clientMacAddress
{
    Client *client;
    for (Client *newClient in self.clients)
    {
        if ([newClient.macAddress isEqualToString:clientMacAddress]) {
            client = newClient;
            [self.clients removeObject:newClient];
            break;
        }
    }
    return client;
}

@end