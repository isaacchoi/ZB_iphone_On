//
//  ViewController.m
//  final project
//
//  Created by sang tang on 11/8/13.
//  Copyright (c) 2013 cs m117. All rights reserved.
//

#import "ViewController.h"
#import "clientList.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textName;
@property (weak, nonatomic) IBOutlet UITextField *textMessage;
@property (weak, nonatomic) IBOutlet UITextField *textMacAaddress;
//@property (strong,nonatomic) website *newSubmission;
@property (strong,nonatomic) clientList *list;
@property (weak, nonatomic) IBOutlet UIPickerView *MacAddressSelection;
@end

@implementation ViewController

//-(website *)newSubmission
//{
//    if (!_newSubmission) _newSubmission = [[website alloc] init];
//    return _newSubmission;
//}

-(clientList *)list
{
    if (!_list) _list = [[clientList alloc] init];
    return _list;
}

- (IBAction)submitNewMessage:(id)sender {
//   [self.newSubmission newMacAddress:self.textMacAaddress.text newName:self.textName.text newMessage:self.textMessage.text];

    Client *newClient = [[Client alloc] init];
    [newClient addClientMacAddress:self.textMacAaddress.text clientName:self.textName.text clientMessage:self.textMessage.text];
    [self.list addClient:newClient];
}

- (IBAction)clientLog:(id)sender {
    [self.list clientLog];
}

@end
