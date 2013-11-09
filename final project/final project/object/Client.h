//
//  Client.h
//  final project
//
//  Created by sang tang on 11/9/13.
//  Copyright (c) 2013 cs m117. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Client : NSObject

@property (strong,nonatomic) NSString *name;
@property (strong,nonatomic) NSMutableArray *message;
@property (strong,nonatomic) NSString *macAddress;

-(void)addClientMacAddress:(NSString *)macADdress clientName:(NSString *)name clientMessage:(NSString*)message;
-(void)insertMessage:(NSString *)newMessage;
-(void)removeMessageAtIndexes:(NSUInteger)indexes;

@end
