//
//  Keychain.h
//  Checkmail
//
//  Created by Willy Blandin on 14/03/2012.
//  Copyright (c) 2012 DomoHood. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Security/Security.h>

@class Keychain;

static Keychain *keychainInstance;

@interface Keychain : NSObject {
    NSString *savedPassword;
    NSString *savedLogin;
}

+(Keychain*) instance;
-(NSString*)getPassword:(NSString *)login;
@end
