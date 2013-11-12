//
//  ViewController.h
//  final project
//
//  Created by sang tang on 11/8/13.
//  Copyright (c) 2013 cs m117. All rights reserved.
//

#import <CoreBluetooth/CoreBluetooth.h>
#import <UIKit/UIKit.h>
#import "website.h"

@interface ViewController : UIViewController <CBPeripheralDelegate, CBCentralManagerDelegate>
{
    CBCentralManager *mgr;
    CBPeripheral *per;
}

//@property (strong,nonatomic) CBCentralManager *mgr;
//@property (strong,nonatomic) CBPeripheral *per;

- (void) startScan;

@end
