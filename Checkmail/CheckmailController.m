//
//  CheckmailController.m
//  Checkmail
//
//  Created by Willy Blandin on 14/03/2012.
//  Copyright (c) 2012 DomoHood. All rights reserved.
//

#import "CheckmailController.h"
#import "PrefWindowController.h"

@implementation CheckmailController

-(IBAction)showPrefs:(id)sender {
    // nil?
    if (!prefController) {
        prefController = [[PrefWindowController alloc] init];
    }
    
    [prefController show];
}

-(IBAction)checkMails:(id)sender {
    NSString *account = [Configurator getConfig];
    
    if (account == nil) {
        [self showPrefs:nil];
        return;
    }
    
    @try {
        NSUInteger count = [[Checker instance] checkWithUsername:account
                                             password:[[Keychain instance]getPassword:account]];
        [statusItem setTitle:[NSString stringWithFormat:@"%lu", count]];    
    } @catch (NSException *e) {
        NSLog(@"Exception: Couldn't fetch mail for account %@\n%@", account, e);
        [statusItem setTitle:@"!!!"];
        return;
    }
}

- (void)awakeFromNib {
    statusItem = [[NSStatusBar systemStatusBar]
                  statusItemWithLength:NSVariableStatusItemLength];
    
    [statusItem setTitle:@"..."];
    [statusItem setHighlightMode:YES];
    [statusItem setMenu:statusMenu];
    
    // checking mail every 5min
    [NSTimer scheduledTimerWithTimeInterval:300.0
                                     target:self
                                   selector:@selector(checkMails:)
                                   userInfo:nil
                                    repeats:YES];
    
    [self checkMails:nil];
}

@end
