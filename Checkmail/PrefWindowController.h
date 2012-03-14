//
//  PrefWindowController.h
//  Checkmail
//
//  Created by Willy Blandin on 13/03/2012.
//  Copyright (c) 2012 DomoHood. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface PrefWindowController : NSWindowController {
    IBOutlet NSTextField *textField;
    IBOutlet NSButton *done;
}

-(IBAction)clickDone:(id)sender;
-(void)show;
@end
