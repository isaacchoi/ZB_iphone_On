//
//  AppDelegate.h
//  final project
//
//  Created by sang tang on 11/8/13.
//  Copyright (c) 2013 cs m117. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreBluetooth/CoreBluetooth.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate,CBCentralManagerDelegate, CBPeripheralDelegate>
{
    CBCentralManager *manager;
    CBPeripheral *peripheral;
    
    BOOL autoConnect;
}

@property (strong, nonatomic) UIWindow *window;

- (void) startScan;
- (void) stopScan;

@end

