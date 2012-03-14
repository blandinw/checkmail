//
//  CheckmailController.h
//  Checkmail
//
//  Created by Willy Blandin on 14/03/2012.
//  Copyright (c) 2012 DomoHood. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Checker.h"
#import "Configurator.h"
#import "Keychain.h"

@class PrefWindowController;

@interface CheckmailController : NSObject {
    IBOutlet NSMenu *statusMenu;
    NSStatusItem *statusItem;
    
    PrefWindowController *prefController;
}

-(IBAction)showPrefs:(id)sender;
-(IBAction)checkMails:(id)sender;

@end
