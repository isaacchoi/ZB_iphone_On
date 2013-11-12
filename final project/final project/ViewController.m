//
//  ViewController.m
//  final project
//
//  Created by sang tang on 11/8/13.
//  Copyright (c) 2013 cs m117. All rights reserved.
//

#import "ViewController.h"
#import "clientList.h"

NSString *const computerFanNode = @"0";
NSString *const LampNode = @"1";
NSString *const sangBtNode = @"3";
NSString *const sangRNode = @"4";

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textMessage;
@property (weak, nonatomic) IBOutlet UITextField *textMacAaddress;
@property (strong,nonatomic) website *newSubmission;
//@property (strong,nonatomic) clientList *list;
@end

@implementation ViewController

-(website *)newSubmission
{
    if (!_newSubmission) _newSubmission = [[website alloc] init];
    return _newSubmission;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    mgr = [[CBCentralManager alloc] initWithDelegate:self queue:nil];
}

//-(clientList *)list
//{
//    if (!_list) _list = [[clientList alloc] init];
//    return _list;
//}

- (IBAction)submitNewMessage:(id)sender {
 
    [self.newSubmission thisNodeId:sangBtNode changeMessage:self.textMacAaddress.text];
    [self.newSubmission thisNodeId:sangRNode changeMessage:self.textMessage.text];

//    Client *newClient = [[Client alloc] init];
//    [newClient addClientMacAddress:self.textMacAaddress.text clientName:self.textName.text clientMessage:self.textMessage.text];
//    [self.list addClient:newClient];
}

//
//- (IBAction)clientLog:(id)sender {
//    [self.list clientLog];
//}


- (void)centralManager:(CBCentralManager *)central didDiscoverPeripheral:(CBPeripheral *)peripheral advertisementData:(NSDictionary *)advertisementData RSSI:(NSNumber *)RSSI
{
    NSLog(@"we are here");
    NSLog([NSString stringWithFormat:@"%@",[advertisementData description]]);
}

-(void)centralManager:(CBCentralManager *)central didRetrievePeripherals:(NSArray *)peripherals{
    NSLog(@"This is it!");
}

- (IBAction)computerFanSlider:(UISlider *)sender {
    [self.newSubmission thisNodeId:computerFanNode changeMessage:[NSString stringWithFormat:@"%i",(int)(sender.value*255)]];
}
- (IBAction)lampToggle:(UISwitch *)sender {
    if (sender.isOn) {
        [self.newSubmission thisNodeId:LampNode changeMessage:@"1"];
    }
    else
        [self.newSubmission thisNodeId:LampNode changeMessage:@"0"];
    
}

- (void)centralManagerDidUpdateState:(CBCentralManager *)central{
    NSString *messtoshow;
    
    switch (central.state) {
        case CBCentralManagerStateUnknown:
        {
            NSLog(@"State unknown, update imminent.");
            messtoshow=[NSString stringWithFormat:@"State unknown, update imminent."];
            break;
        }
        case CBCentralManagerStateResetting:
        {
            NSLog(@"The connection with the system service was momentarily lost, update imminent.");
            messtoshow=[NSString stringWithFormat:@"The connection with the system service was momentarily lost, update imminent."];
            break;
        }
        case CBCentralManagerStateUnsupported:
        {
            NSLog(@"The platform doesn't support Bluetooth Low Energy");
            messtoshow=[NSString stringWithFormat:@"The platform doesn't support Bluetooth Low Energy"];
            break;
        }
        case CBCentralManagerStateUnauthorized:
        {
            NSLog(@"The app is not authorized to use Bluetooth Low Energy");
            messtoshow=[NSString stringWithFormat:@"The app is not authorized to use Bluetooth Low Energy"];
            break;
        }
        case CBCentralManagerStatePoweredOff:
        {
            NSLog(@"Bluetooth is currently powered off.");
            messtoshow=[NSString stringWithFormat:@"Bluetooth is currently powered off."];
            break;
        }
        case CBCentralManagerStatePoweredOn:
        {
            NSLog(@"Bluetooth is currently powered on and available to use.");
            messtoshow=[NSString stringWithFormat:@"Bluetooth is currently powered on and available to use."];
            [self startScan];
            //[mgr retrieveConnectedPeripherals];
            
            //--- it works, I Do get in this area!
            
            break;
        }
    }
    NSLog(@"this work");
}

- (void) startScan
{
    NSDictionary *options = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithBool:NO], CBCentralManagerScanOptionAllowDuplicatesKey, nil];
    [mgr scanForPeripheralsWithServices:nil options:options];
}

- (void) stopScan
{
    [mgr stopScan];
}

@end
