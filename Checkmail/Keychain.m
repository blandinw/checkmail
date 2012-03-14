//
//  Keychain.m
//  Checkmail
//
//  Created by Willy Blandin on 14/03/2012.
//  Copyright (c) 2012 DomoHood. All rights reserved.
//

#import "Keychain.h"

@implementation Keychain
+(Keychain*)instance {
    if (!keychainInstance) {
        keychainInstance = [[self alloc] init];
    }
    
    return keychainInstance;
}

-(NSString*)getPassword:(NSString *)login
{
    if (savedPassword != nil && [login isEqualToString:savedLogin]) {
        return savedPassword;
    }
    
    const char *serverName = "accounts.google.com";
    const char *accountName = [login UTF8String];
    const char *path = "/ServiceLogin";
    savedLogin = login;
    
    // on return
    UInt32 passwordLength;
    char *passwordData;
    
    OSStatus status = SecKeychainFindInternetPassword(
                                                      NULL,
                                                      (UInt32)strlen(serverName),
                                                      serverName,
                                                      0,
                                                      NULL,
                                                      (UInt32)strlen(accountName),
                                                      accountName,
                                                      0,//(UInt32)strlen(path),
                                                      NULL,//path,
                                                      NULL, 
                                                      kSecProtocolTypeAny, 
                                                      kSecAuthenticationTypeAny, 
                                                      &passwordLength,
                                                      (void**) &passwordData,
                                                      NULL
                                                      );
    
    if (status != 0) {
        // failed
        return nil;
    }
    
    char *cstring = (char*)malloc(passwordLength + 1);
    memcpy(cstring, passwordData, passwordLength);
    cstring[passwordLength] = '\0';
    
    savedPassword = [NSString stringWithCString:cstring];
    
    free(cstring);
    SecKeychainItemFreeContent (NULL, passwordData);
    
    return savedPassword;
}
@end
