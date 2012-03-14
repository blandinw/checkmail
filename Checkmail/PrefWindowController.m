//
//  PrefWindowController.m
//  Checkmail
//
//  Created by Willy Blandin on 13/03/2012.
//  Copyright (c) 2012 DomoHood. All rights reserved.
//

#import "PrefWindowController.h"
#import "Configurator.h"

@implementation PrefWindowController

- (id)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow:window];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (id)init {
    self = [super initWithWindowNibName:@"PrefWindow"];
    return self;
}

- (void)windowDidLoad
{
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}

-(IBAction)clickDone:(id)sender {
    [[self window] close];
    [Configurator saveConfig:[textField stringValue]]; 
}

-(void)show {
    [NSApp activateIgnoringOtherApps:YES];
    [self showWindow:nil];
    
    NSString* persistedName = [Configurator getConfig];
    [textField setStringValue:persistedName ? persistedName : @""];
}
@end
