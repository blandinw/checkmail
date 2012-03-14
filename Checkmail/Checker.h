//
//  Checker.h
//  checkmail
//
//  Created by Willy Blandin on 12/03/2012.
//  Copyright (c) 2012 DomoHood. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MailCore/MailCore.h>

@class Checker;

static Checker *checkerInstance;
@interface Checker : NSObject {
}

-(NSUInteger)checkWithUsername:(NSString*)username password:(NSString*)password;
+(Checker*)instance;
@end
