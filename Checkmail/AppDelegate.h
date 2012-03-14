//
//  AppDelegate.h
//  checkmail
//
//  Created by Willy Blandin on 12/03/2012.
//  Copyright (c) 2012 DomoHood. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class CheckmailController;

@interface AppDelegate : NSObject <NSApplicationDelegate> {
    IBOutlet CheckmailController *checkmailController;
}

@end
